note
	description: "MATRIX_ROTATION application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_ROTATION

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			a : ARRAY2[INTEGER]
			b : ARRAY2[INTEGER]
			n : INTEGER
			m : INTEGER
			i : INTEGER
			j : INTEGER
		do
			io.read_integer
			n := io.last_integer
			io.read_integer
			m := io.last_integer
			io.read_line
			create a.make_filled (0, n, m)
			create b.make_filled (0, m, n)
			from i := 1 until i > n loop
				from j := 1 until j > m loop
					io.read_integer
					a[i, j] := io.last_integer
					if io.last_string.is_equal ("clockwise") then
						b[j, n - i + 1] := a[i, j]
					else
						b[m - j + 1, i] := a[i, j]
					end
					j := j + 1
				end
				i := i + 1
			end
			from i := 1 until i > m loop
				from j := 1 until j > n loop
					print(b[i, j].out + " ")
					j := j + 1
				end
				print("%N")
				i := i + 1
			end
		end
end
