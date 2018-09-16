note
	description: "Matrices application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	matrix: ARRAY2[INTEGER]
	matrix2: ARRAY2[INTEGER]
	e_matrix: ARRAY2[INTEGER]

feature {NONE} -- Initialization.
	make
		local
			i,j: INTEGER
		do
			--Testing
			create e_matrix.make_filled(0,2,2)
			create matrix.make_filled(0,3,3)
			from
				i:=1
			until
				i>=4
			loop
				from
					j:=1
				until
					j>=4
				loop
					io.read_integer
					add_element(matrix,io.last_integer,i,j)
					j:=j+1
				end
				i:=i+1
			end
			print(matrix)

			create matrix2.make_filled(0,3,3)
			from
				i:=1
			until
				i>=4
			loop
				from
					j:=1
				until
					j>=4
				loop
					io.read_integer
					add_element(matrix2,io.last_integer,i,j)
					j:=j+1
				end
				i:=i+1
			end
			print(matrix2)

			print(add(matrix,matrix2))
			print(minus(matrix,matrix2))
			print(prod(matrix,matrix2))

		end

feature
	add(m1,m2: ARRAY2[INTEGER]):ARRAY2[INTEGER]
		local
			m3: ARRAY2[INTEGER]
			i,j: INTEGER
		do
			create m3.make_filled (0, 3,3)
			from
				i:=1
			until
				i>=4
			loop
				from
					j:=1
				until
					j>=4
				loop
					m3.put (m1.item (i, j)+m2.item (i,j), i,j)
					j:=j+1
				end
				i:=i+1
			end
		Result:=m3
		end

	minus(m1,m2: ARRAY2[INTEGER]):ARRAY2[INTEGER]
		local
			m3: ARRAY2[INTEGER]
			i,j: INTEGER
		do
			create m3.make_filled (0, 3,3)
			from
				i:=1
			until
				i>=4
			loop
				from
					j:=1
				until
					j>=4
				loop
					m3.put (m1.item (i, j)-m2.item (i,j),i, j)
					j:=j+1
				end
				i:=i+1
			end
		Result:=m3
		end

	prod(m1,m2: ARRAY2[INTEGER]):ARRAY2[INTEGER]
		local
			m3: ARRAY2[INTEGER]
			i,j: INTEGER
		do
			create m3.make_filled (0, 3,3)
			from
				i:=1
			until
				i>=4
			loop
				from
					j:=1
				until
					j>=4
				loop
					m3.put (product(i,j,m1,m2),i, j)
					j:=j+1
				end
				i:=i+1
			end
		Result:=m3
		end

	det(m: ARRAY2[INTEGER]):INTEGER
		local
			dt: INTEGER
		do
			dt:=m.item (1, 1)*determinant(create_matrix(1,1,e_matrix,m))-m.item (1, 2)*determinant(create_matrix(1,2,e_matrix,m))+m.item (1, 3)*determinant(create_matrix(1,3,e_matrix,m))
		Result:=dt
		end



	add_element(arr: ARRAY2[INTEGER];num,i,j: INTEGER)
		do
			arr.put(num, i, j)
		end

	product(i,j:INTEGER; m1,m2: ARRAY2[INTEGER]): INTEGER
		local
			p: INTEGER
		do
			p:=m1.item(i,1)*m2.item (1,j)+m1.item (i,2)*m2.item (2,j)+m1.item (i,3)*m2.item (3,j)
		Result:=p
		end

	determinant(m: ARRAY2[INTEGER]): INTEGER
		local
			dt: INTEGER
		do
			dt:=m.item (1,1)*m.item (2, 2)-m.item (1, 2)*m.item (2, 1)
		Result:=dt
		end

	create_matrix(i,j: INTEGER; m0,m: ARRAY2[INTEGER]): ARRAY2[INTEGER]
		do
			if
				j=1
			then
				m0.put (m.item (2,2), 1, 1)
				m0.put (m.item (2,3), 1, 2)
				m0.put (m.item (3,2), 2, 1)
				m0.put (m.item (3,3), 2, 2)
			end
			if
				j=2
			then
				m0.put (m.item (2,1), 1, 1)
				m0.put (m.item (2,3), 1, 2)
				m0.put (m.item (3,1), 2, 1)
				m0.put (m.item (3,3), 2, 2)
			end
			if
				j=3
			then
				m0.put (m.item (2,1), 1, 1)
				m0.put (m.item (2,2), 1, 2)
				m0.put (m.item (3,1), 2, 1)
				m0.put (m.item (3,2), 2, 2)
			end
	Result:=m0
		end

end

