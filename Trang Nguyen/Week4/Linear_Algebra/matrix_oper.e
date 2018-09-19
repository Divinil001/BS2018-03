note
	description: "Summary description for {MATRIX_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_OPER

feature -- Access

	det (m: ARRAY2 [INTEGER]): INTEGER
			-- Returns the determinant of matrices
		local
			i, j, k: INTEGER
			n: ARRAY2 [INTEGER]
		do
			if m.height = m.width then
				if m.height = 2 then
					Result := m.item (1, 1) * m.item (2, 2) - m.item (1, 2) * m.item (2, 1)
				else
					Result := 0
					from k := 1
					until k > m.width
					loop
						-- Create matrix n
						create n.make_filled (0, m.height - 1, m.width - 1)
						from i := 1
						until i = m.height
						loop
							from j := 1
							until j = m.width
							loop
								if j >= k then
									n.put (m.item (i + 1, j + 1), i, j)
								else n.put (m.item (i + 1, j), i, j)
								end
								j := j + 1
							end
							i := i + 1
						end

						if k \\ 2 = 0 then
							Result := Result - m.item (1, k) * det (n)
						else Result := Result + m.item (1, k) * det (n)
						end
						k := k + 1
					end
				end
			else print ("Can not find determinant%N")
			end
		end

	prod (m1: ARRAY2 [INTEGER]; m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
			-- Returns product of matrices m1m2
		local
			i, j, k: INTEGER
		do
			create Result.make_filled (0, m1.height, m2.width)
			if m1.width = m2.height then
				from i := 1
				until i > m1.height
				loop
					from j := 1
					until j > m2.width
					loop
						from k := 1
						until k > m1.width
						loop
							Result.put (Result.item (i, j) + m1.item (i, k) * m2.item (k, j), i, j)
							k := k + 1
						end
						j := j + 1
					end
					i := i + 1
				end
			else print ("Can not multiply these matrices%N")
			end
		end

	minus (m1: ARRAY2 [INTEGER]; m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
			-- Returns the subtraction of matrices m1 - m2
		local
			i, j: INTEGER
		do
			create Result.make_filled (0, m1.height, m1.width)
			if m1.height = m2.height and m1.width = m2.width then
				from i := 1
				until i > m1.height
				loop
					from j := 1
					until j > m1.width
					loop
						Result.put (m1.item (i, j) - m2.item (i, j), i, j)
						j := j + 1
					end
					i := i + 1
				end
			else print ("Can not subtract these matrices%N")
			end
		end

	add (m1: ARRAY2 [INTEGER]; m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
			-- Returns the addition of matrices m1 + m2
		local
			i, j: INTEGER
		do
			create Result.make_filled (0, m1.height, m1.width)
			if m1.height = m2.height and m1.width = m2.width then
				from i := 1
				until i > m1.height
				loop
					from j := 1
					until j > m1.width
					loop
						Result.put (m1.item (i, j) + m2.item (i, j), i, j)
						j := j + 1
					end
					i := i + 1
				end
			else print ("Can not add these matrices%N")
			end
		end

end
