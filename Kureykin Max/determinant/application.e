note
	description: "determinant application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	--m1:ARRAY2[INTEGER]
	--m2,mS:ARRAY2[INTEGER]
	mo:MATRIX_OPER
	vo:VECTOR_OPER

	v1,v2:ARRAY[INTEGER]
	vec:ARRAY[INTEGER]

	i:INTEGER

	make
			-- Run application.
		do
			--| Add your code here
			create mo
			create vo

			create v1.make_empty
			create v2.make_empty
			create vec.make_empty

			--m1 := mo.make_matrix
			--m2 := mo.make_matrix

			--mo.print_matrix (m1)
			--mo.print_matrix (m2)

			--mS := mo.add (m1, m2)
			--mo.print_matrix (mS)

			--mS := mo.minus (m1, m2)
			--mo.print_matrix (mS)

			--mS := mo.prod (m1, m2)
			--mo.print_matrix (mS)

			--print("Det of m1= " + mo.det (m1, m1.height).out+"%N")
			--print("Det of m2= " + mo.det (m2, m2.height).out+"%N")

			v1.force(2,v1.count + 1)
			v1.force(1,v1.count + 1)

			v2.force(3,v2.count + 1)
			v2.force(4,v2.count + 1)

			print("Triangle are = " + vo.triangle_area (v1, v2).out +"%N")


			v1.force(3,v1.count + 1)
			v2.force(1,v2.count + 1)

			vec := vo.cross_product (v1, v2)
			print("Cross prod of v1 and v2= ")
			from
				i := 1
			until
				i = vec.count + 1
			loop
				print(vec[i].out + " ")
				i := i + 1
			end
			print("%N")

			print("Dot prod of v1 and v2= " + vo.dot_product (v1, v2).out + "%N")

		end

end
