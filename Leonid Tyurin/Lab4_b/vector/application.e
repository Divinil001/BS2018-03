note
	description: "vector application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	op:VECTOR_OPER
	v1, v2 : ARRAY[INTEGER]
	a:REAL_64

	make
		do
			create op
			create v1.make_empty
			v1.force(0, 1)
			v1.force(1, 2)
			create v2.make_empty
			v2.force(2, 1)
			v2.force(0, 2)
			a := op.triangle_area(v1, v2)
			print(a)
		end

end
