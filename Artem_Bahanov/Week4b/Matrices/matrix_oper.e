class
	MATRIX_OPER


	feature
		add(m1, m2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
		require
			is_equal_rows: m1.height = m2.height
			is_equal_columns: m1.width = m2.width
		local
			i, j: INTEGER
		do
			create Result.make_filled (0, m1.height, m1.width)
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
					Result.put (m1.item (i, j) + m2.item (i, j), i, j)
					j := j + 1
				end
				i := i + 1
			end
		end

		minus(m1, m2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
		require
			is_equal_rows: m1.height = m2.height
			is_equal_columns: m1.width = m2.width
		local
			i, j: INTEGER
		do
			create Result.make_filled (0, m1.height, m1.width)
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
					Result.put (m1.item (i, j) - m2.item (i, j), i, j)
					j := j + 1
				end
				i := i + 1
			end
		end

		prod(m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
		require
			prod_condition: m1.width = m2.height
		local
			answer: ARRAY2[INTEGER]
			i, j, k, s: INTEGER
		do
			create answer.make_filled (0, m1.height, m2.width)
			from
				i := 1
				j := 1
			until
				i > answer.height or j > answer.width
			loop
				from
					k := 1
					s := 0
				until
					k > m1.width
				loop
					s := s + m1.item (i, k)*m2.item (k, j)
					k := k + 1
				end
				answer.put (s, i, j)
				if j = answer.width then
					j := 1
					i := i + 1
				else
					j := j + 1
				end
			end
			Result := answer
		end

		det(m: ARRAY2 [INTEGER]): INTEGER
		require
			det_condition: m.width = m.height
			non_zero: m.width /~ 0
		local
			i, j, k, k0, l, l0: INTEGER
			m0: ARRAY2[INTEGER]
		do
			create m0.make_filled (0, m.width - 1, m.width - 1)
			if m.width = 1 then
				Result := m.item (1, 1)
			elseif m.width = 2 then
				Result := m.item (1, 1) * m.item (2, 2) - m.item (1, 2) * m.item (2, 1)
			else
				from
					i := 1
					j := 1
					Result := 0
				until
					i > m.width
				loop
					from
						k := 2
						k0 := 1
					until
						k > m.height
					loop
						from
							l := 1
							l0 := 1
						until
							l > m.width
						loop
							if l /~ i then
								m0.put (m.item (k, l), k0, l0)
								l0 := l0 + 1
							end
							l := l + 1
						end
						k := k + 1
						k0 := k0 + 1
					end
					Result := Result + pow(-1, i + 1) * det(m0) * m.item (1, i)
					i := i + 1
				end
			end
		end

		print_matrix(m: ARRAY2[INTEGER]): STRING
		local
			i, j: INTEGER
		do
			Result := ""
			from
				i := 1
			until
				i > m.height
			loop
				from
					j := 1
				until
					j > m.width
				loop
					Result.append (m.item (i, j).out + "%T")
					j := j + 1
				end
				Result.append ("%N")
				i := i + 1
			end
		end

		pow(a, b: INTEGER): INTEGER
		local
			i: INTEGER
		do
			from
				i := 1
				Result := 1
			until
				i > b
			loop
				Result := Result * a
				i := i + 1
			end
		end
end
