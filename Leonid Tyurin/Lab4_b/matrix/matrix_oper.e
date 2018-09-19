note
	description: "Summary description for {MATRIX_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_OPER

feature

	matrix_out(m:ARRAY2[INTEGER])
		local
			i, j:INTEGER
		do
			from
				i := 1
			until
				i = m.height + 1
			loop
				from
					j := 1
				until
					j = m.width + 1
				loop
					io.put_string (m[i, j].out + " ")
					j := j + 1
				end
				io.new_line
				i := i + 1
			end
		end

	add(m1, m2 : ARRAY2[INTEGER]):ARRAY2[INTEGER]
		require
			size : m1.height = m2.height and m1.width = m2.width
		local
			i, j : INTEGER
			temp : ARRAY2[INTEGER]
		do
			create temp.make_filled (0, m1.height, m1.width)
			from
				i := 1
			until
				i = m1.height + 1
			loop
				from
					j := 1
				until
					j = m1.width + 1
				loop
					temp[i, j] := m1[i, j] + m2[i, j]
					j := j + 1
				end
				i := i + 1
			end
			result := temp
		end

	minus(m1, m2 : ARRAY2[INTEGER]):ARRAY2[INTEGER]
		require
			size : m1.height = m2.height and m1.width = m2.width
		local
			i, j : INTEGER
			temp : ARRAY2[INTEGER]
		do
			create temp.make_filled (0, m1.height, m1.width)
			from
				i := 1
			until
				i = m1.height + 1
			loop
				from
					j := 1
				until
					j = m1.width + 1
				loop
					temp[i, j] := m1[i, j] - m2[i, j]
					j := j + 1
				end
				i := i + 1
			end
			result := temp
		end

	prod(m1, m2:ARRAY2[INTEGER]):ARRAY2[INTEGER]
		require
			able_to_mult : m1.width = m2.height
		local
			i, j, k : INTEGER
			temp : ARRAY2[INTEGER]
			num :INTEGER
		do
			create temp.make(m1.height, m2.width)
			from
				i := 1
			until
				i = m1.height + 1
			loop
				from
					j := 1
				until
					j = m2.width + 1
				loop
					num := 0
					from
						k := 1
					until
						k = m1.width + 1
					loop
						num := num + m1[i, k] * m2[k, j]
						k := k + 1
					end
					temp[i, j] := num
					j := j + 1
				end
				i := i + 1
			end
			result := temp
		end

	determ(m:ARRAY2[INTEGER]; n:INTEGER):INTEGER
		require
			size : m.height = m.width
		local
			i, j, c, h, k , power, det: INTEGER
			subm:ARRAY2[INTEGER]
		do
			create subm.make_filled(0, m.height - 1, m.height - 1)
			det := 0
			if n = 1 then
				result := m[1, 1]
			elseif n = 2 then
				det := m[1, 1] * m[2, 2] - m[2, 1] * m[1, 2]
				result := det
			else
				from c := 1 until c = n + 1 loop
					h := 1
					k := 1
					from i := 2 until i = n + 1 loop
						from j := 1 until j = n + 1 loop
							if j /= c then
								subm[h, k] := m[i, j]
								k := k + 1
								if k - 1 = n - 1 then
									h := h + 1
									k := 1
								end
							end
							j := j + 1
						end
						i := i + 1
					end
					c := c + 1
					if c \\ 2 = 0 then
						power := 1
					else
						power := -1
					end
					det := det + power * m[1, c - 1] * determ(subm, n - 1)
				end
				result := det
			end

		end

end
