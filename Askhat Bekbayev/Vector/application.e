class
	APPLICATION

create
	make

feature
	v1,v2: ARRAYED_LIST[INTEGER]
	oper: VECTOR_OPER
	make
		do
			create oper
			create v1.make (0)
			create v2.make (0)

			v1.force (2)
			v1.force (3)
			v1.force (4)

			v2.force (5)
			v2.force (6)
			v2.force (7)

			print(oper.cross_product (v1, v2))
			print("%N")

			print(oper.dot_product (v1, v2))
			print("%N")
			print("%N")

			print(oper.triangle_area (v1, v2))
			print(" (Or in INTEGER: " + oper.triangle_area (v1, v2).rounded.out + ")")
			print("%N")
		end
end
