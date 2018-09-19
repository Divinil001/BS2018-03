class
	MATRIX_OPER
feature
	add(m1, m2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
		require
			is_equal: m1.width = m2.width and m1.height = m2.height
		local
			i, j: INTEGER
			res: ARRAY2[INTEGER]
		do
			create res.make_filled (0, m1.height, m1.width)
			from
				i := 1
			until
				i > m1.height
			loop
				from
					j := 1
				until
					j > m1.width
				loop
					res.put (m1.item(i, j) + m2.item(i, j), i, j)
					j := j + 1
				end
				i := i + 1
			end
			Result := res
		end
	minus(m1, m2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
		require
			is_equal: m1.width = m2.width and m1.height = m2.height
		local
			i, j: INTEGER
			res: ARRAY2[INTEGER]
		do
			create res.make_filled (0, m1.height, m1.width)
			from
				i := 1
			until
				i > m1.height
			loop
				from
					j := 1
				until
					j > m1.width
				loop
					res.put (m1.item(i, j) - m2.item(i, j), i, j)
					j := j + 1
				end
				i := i + 1
			end
			Result := res
		end
		prod(m1, m2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
			require
				is_able_to_prod: m1.width = m2.height
			local
				res: ARRAY2[INTEGER]
				i, j, k: INTEGER
			do
				create res.make_filled (0, m1.height, m2.width)
				from i := 1
				until i > m1.width
				loop
					from j := 1
					until j > m2.height
					loop
						from k := 1
						until k > m1.height
						loop
							res[i, j] := res[i, j] + (m1[i, k] * m2[k, j])
							k := k + 1
						end
						j := j + 1
					end
					i := i + 1
				end
				Result := res
			end
		det(m: ARRAY2[INTEGER]): INTEGER
			require
				is_able: m.width = m.height
			do
				Result := recursive_det(m, m.width)
			end
		recursive_det(m: ARRAY2[INTEGER]; n: INTEGER): INTEGER
			local
				answer: INTEGER
				new_matrix: ARRAY2[INTEGER]
				index: INTEGER
				i, j, k: INTEGER
				q, w: INTEGER
				our_k: INTEGER
			do
				answer := 0
				if n = 2 then
					answer := m[1,1] * m[2,2]
					answer := answer - m[1,2]*m[2,1]
					Result := answer
				else
					create new_matrix.make_filled (0, n-1, n-1)
					from i := 1
					until i > n
					loop
						our_k := i

						from j := 1
							 q := 1
						until j > n
						loop
							if j /= 1 then
								from k := 1
									 w := 1
								until k > n
								loop
									if k /= our_k then
										new_matrix[q, w] := m[j, k]
									w := w + 1
									end
									k := k + 1
								end
								q := q + 1
							end
							j := j + 1
						end
						index := ((-1).power (i+1)).floor
						index := index * (m[1, i].as_integer_32)
						index := index * recursive_det (new_matrix, n-1)
--						print(new_matrix)
--						print("%N%N")
						answer := answer + index
						i := i + 1
					end
					Result := answer
				end
			end
end
