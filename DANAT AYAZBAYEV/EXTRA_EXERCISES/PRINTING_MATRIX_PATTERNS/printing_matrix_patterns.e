note
	description: "PRINTING_MATRIX_PATTERNS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	PRINTING_MATRIX_PATTERNS

inherit
	ARGUMENTS

create
	make

feature
	min (a, b : INTEGER) : INTEGER
		do
			if a > b then
				Result := b
			else
				Result := a
			end
		end
	printing_matrix_spiral (m : ARRAY2[INTEGER])
		local
			i : INTEGER
			j : INTEGER
			cnt : INTEGER
			printed : INTEGER
			r_print : INTEGER
			c_print : INTEGER
			some_value : INTEGER
		do
			printed := 0
			some_value := 0
			r_print := m.width
			c_print := m.height - 1
			from
				i := 1
				j := 0
			until
				some_value > m.width * m.height - 1
			loop
				if printed \\ 2 = 0 then
					from
						cnt := 1
					until
						cnt > r_print
					loop
						if printed \\ 4 = 0 then
							j := j + 1
						else
							j := j - 1
						end
						print(m[i, j].out + " ")
						cnt := cnt + 1
						some_value := some_value + 1
					end
					r_print := r_print - 1
				else
					from
						cnt := 1
					until
						cnt > c_print
					loop
						if printed \\ 4 = 1 then
							i := i + 1
						else
							i := i - 1
						end
						print(m[i, j].out + " ")
						cnt := cnt + 1
						some_value := some_value + 1
					end
					c_print := c_print - 1
				end
				printed := printed + 1
			end
		end

feature {NONE}
	make
		local
			a : ARRAY2[INTEGER]
			n : INTEGER
			m : INTEGER
			i : INTEGER
			j : INTEGER
		do
			io.read_integer
			n := io.last_integer
			io.read_integer
			m := io.last_integer
			create a.make_filled(0, n, m)
			from
				i := 1
			until
				i > n
			loop
				from
					j := 1
				until
					j > m
				loop
					io.read_integer
					a[i, j] := io.last_integer
					j := j + 1
				end
				i := i + 1
			end
			printing_matrix_spiral(a)
		end

end
