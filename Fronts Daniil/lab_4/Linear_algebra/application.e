note
	description: "Linear_algebra application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	m1: ARRAY2[INTEGER]
	m2: ARRAY2[INTEGER]
	m_oper: MATRIX_OPER
	v_oper: VECTOR_OPER
	i: INTEGER
	v1: ARRAY[INTEGER]
	v2: ARRAY[INTEGER]
	make
			-- Run application.
		do
			create m1.make_filled (0, 4, 4)
			create m2.make_filled (5, 4, 4)
			create m_oper
			create v_oper
			create v1.make_empty
			create v2.make_empty

			from
				i := 1
			until
				i = m1.count + 1
			loop
				m1.enter (i, i)
				i := i + 1
			end

			from
				i := 1
			until
				i = 4
			loop
				v1.force (i, i)
				v2.force (i + 10, i)
				i := i + 1
			end
			print(m_oper.det (m1))
			print("%N")
			print(m_oper.prod (m1, m2))
			print("%N")
			print(m_oper.minus (m1, m2))
			print("%N")
			print(m_oper.add (m1, m2))
			print("%N")
			print(v_oper.cross_product (v1, v2))
			print("%N")
			print(v_oper.dot_product (v1, v2))
			print("%N")
			print(v_oper.triangle_area (v1, v2))
		end

end
