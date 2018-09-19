class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			create vo
			a1 := << 1, 2, 3 >>
			a2 := << 3, -1, 9 >>
			io.put_string ("a1 a2 cross product - " + vo.print_vector(vo.cross_product(a1, a2)) + "%N")
			io.put_string ("a1 a2 dot product - " + vo.dot_product (a1, a2).out)
			io.put_string ("a1 a2 triangle area - " + vo.triangle_area (a1, a2).out)
		end
	a1, a2: ARRAY[INTEGER]
	vo: VECTOR_OPER
end
