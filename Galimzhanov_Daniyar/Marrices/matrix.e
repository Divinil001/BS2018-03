class
	MATRIX

inherit

	ARGUMENTS

create
	main

feature

	a, b: ARRAY2 [INTEGER]

	add (m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
		require
			can_add: (m1.width = m2.width) and (m1.height = m2.height)
		local
			r: ARRAY2 [INTEGER]
			i, j: INTEGER
		do
			create r.make_filled (0, m1.height, m2.width)
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
					r [i, j] := m1 [i, j] + m2 [i, j]
					j := j + 1
				end
				i := i + 1
			end
			Result := r
		end

	minus (m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
		require
			can_add: (m1.width = m2.width) and (m1.height = m2.height)
		local
			r: ARRAY2 [INTEGER]
			i, j: INTEGER
		do
			create r.make_filled (0, m1.height, m2.width)
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
					r [i, j] := m1 [i, j] - m2 [i, j]
					j := j + 1
				end
				i := i + 1
			end
			Result := r
		end

	print_matrix (r: ARRAY2 [INTEGER])
		local
			i, j: INTEGER
			s: STRING
		do
			print ("%N")
			from
				i := 1
			until
				i = r.height + 1
			loop
				from
					j := 1
				until
					j = r.width + 1
				loop
					s := " "
					s.multiply (5 - r[i, j].out.count)
					print (r [i, j].out + s)
					j := j + 1
				end
				i := i + 1
				print ("%N")
			end
			print("%N")
		end

	prod (m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
		require
			can_prod: m1.width = m2.height
		local
			r: ARRAY2 [INTEGER]
			i, j, m, n: INTEGER

		do
			create r.make_filled (0, m1.height, m2.width)
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
					from
						m := 1
					until
						m = m1.width + 1
					loop
						r [i, j] := r [i, j] + m1 [i, m] * m2 [m, j]
						m := m + 1
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := r
		end

	det (m: ARRAY2 [INTEGER]): INTEGER
		require
			can_det: m.height = m.width
			not_void: m /= void
		local
			k, i, j: INTEGER
			r: ARRAY2 [INTEGER]
		do
			create r.make_filled (0, m.height, m.width * 2 - 1)
			if m.height = 1 then
				Result := 0
			end
			if m.height = 2 then
				Result := m [1, 1] * m [2, 2] - m [1, 2] * m [2, 1]
			end
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
					r [i, j] := m [i, j]
					j := j + 1
				end
				i := i + 1
			end
			from
				i := 1
			until
				i = m.height + 1
			loop
				from
					j := 1
				until
					j = m.width
				loop
					r [i, m.width + j] := m [i, j]
					j := j + 1
				end
				i := i + 1
			end
			from
				i := 1
			until
				i = r.height + 1
			loop
				k := 1
				from
					j := 1
				until
					j = r.height + 1
				loop
					k := k * r [j, j + i - 1]
					j := j + 1
				end
				Result := Result + k
				i := i + 1
			end
			from
				i := r.width
			until
				i = r.width - r.height
			loop
				k := 1
				from
					j := 1
				until
					j = r.height + 1
				loop
					k := k * r [j, i - j + 1]
					j := j + 1
				end
				Result := Result - k
				i := i - 1
			end
		end

	main
		local
			i, j, k: INTEGER
		do
			k := 1
			create a.make_filled (0, 3, 3)
			create b.make_filled (0, 3, 3)
			from
				i := 1
			until
				i = a.height + 1
			loop
				from
					j := 1
				until
					j = a.width + 1
				loop
					a [i, j] := j + i
					b[i, j] := j + 3 - i
					j := j + 1
				end
				i := i + 1
			end
			print("Matrix a:%N")
			print_matrix (a)
			print("%N")
			print("Matrix b:%N")
			print_matrix(b)
			print("a + b:%N")
			print_matrix(add(a, b))
			print("a - b:%N")
			print_matrix(minus(a, b))
			print("Product of a and b:%N")
			print_matrix(prod(a, b))
			print ("Determinant of a: " + det (a).out)
		end

end
