class
	VECTOR_OPER

inherit

	DOUBLE_MATH

create
	main

feature

	k, l: ARRAY [INTEGER]

	print_vector (m: ARRAY [INTEGER])
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i = m.capacity + 1
			loop
				print (m [i].out + " ")
				i := i + 1
			end
			print ("%N")
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

	cross_product (v1, v2: ARRAY [INTEGER]): ARRAY [INTEGER]
		require
			can_product: v1.capacity = v2.capacity
		local
			m, r: ARRAY2 [INTEGER]
		do
			create m.make_filled (0, 3, 3)
			create r.make_filled (0, 3, 1)
			r [1, 1] := v2 [1]
			r [2, 1] := v2 [2]
			r [3, 1] := v2 [3]
			m [1, 1] := 0
			m [2, 2] := 0
			m [3, 3] := 0
			m [1, 2] := - v1 [3]
			m [1, 3] := v1 [2]
			m [2, 1] := v1 [3]
			m [2, 3] := - v1 [1]
			m [3, 1] := - v1 [2]
			m [3, 2] := v1 [1]
			Result := prod (m, r)
		end

	dot_product (v1, v2: ARRAY [INTEGER]): INTEGER
		require
			v1.capacity = v2.capacity
		local
			i, j: INTEGER
		do
			from
				i := 1
			until
				i = v1.capacity + 1
			loop
				Result := Result + v1 [i] * v2 [i]
				i := i + 1
			end
		end

	length (a: ARRAY [INTEGER]): INTEGER_64
		local
			i: INTEGER
			j, s: REAL_64
		do
			j := 0
			From
				i := 1
			until
				i = a.capacity + 1
			loop
				j := j + a [i] * a [i]
				i := i + 1
			end
			j := j.power (0.5)
			Result := j.truncated_to_integer_64
		end

	triangle_area (v1, v2: ARRAY [INTEGER]): INTEGER_64
		require
			v1.capacity = v2.capacity
		do
			Result := length (cross_product (v1, v2)) // 2
		end

	main
		do
			create k.make_filled (1, 1, 3)
			create l.make_empty
			k [1] := 8
			l.force (-8, 1)
			l.force (-14, 2)
			l.force (78, 3)
			print_vector (k)
			print_vector (l)
			print ("Length of vector l: " + length (l).out + "%N")
			print ("Cross product of k and l: ")
			print_vector (cross_product (k, l))
			print ("Triangle area of k and l: " + triangle_area (k, l).out + "%N")
			print ("Dot product of  k and l: " + dot_product (k, l).out)
		end

end
