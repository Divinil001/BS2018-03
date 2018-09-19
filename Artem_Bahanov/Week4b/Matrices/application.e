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

feature {NONE} -- Initialization
	m1, m2, m3, m4, m5: ARRAY2[INTEGER]
	mo: MATRIX_OPER

	make
			-- Run application.
		do
			create mo
			create m1.make_filled(0, 2, 3)
			create m2.make_filled(1, 3, 2)
			m1.put (13, 1, 1)
			m1.put (2, 1, 2)
			m1.put (5, 1, 3)
			m1.put (1, 2, 1)
			m1.put (3, 2, 2)
			m1.put (4, 2, 3)
			m2.put (2, 1, 1)
			m2.put (23, 1, 2)
			m2.put (2, 2, 1)
			m2.put (12, 2, 2)
			m2.put (8, 3, 1)
			m2.put (7, 3, 2)
			io.put_string (mo.print_matrix (m1))
			m3 := mo.prod (m1, m2)
			io.put_string (mo.print_matrix (m1))
			io.put_string (mo.print_matrix (m3))
			create m4.make_filled(0, 4, 4)
			m4.put (10, 1, 1)
			m4.put (2, 1, 2)
			m4.put (5, 1, 3)
			m4.put (7, 1, 4)
			m4.put (1, 2, 1)
			m4.put (2, 2, 2)
			m4.put (67, 2, 3)
			m4.put (12, 2, 4)
			m4.put (11, 3, 1)
			m4.put (7, 3, 2)
			m4.put (7, 3, 3)
			m4.put (3, 3, 4)
			m4.put (4, 4, 1)
			m4.put (4, 4, 2)
			m4.put (14, 4, 3)
			m4.put (13, 4, 4)
			print(mo.print_matrix (m4))
			print("det m4 = " + mo.det (m4).out)
			print("%N")
			create m5.make_filled(0, 2, 2)
			m5.put(3, 1, 1)
			m5.put(5, 1, 2)
			m5.put(8, 2, 1)
			m5.put(2, 2, 2)
			print("det m5 = " + mo.det (m5).out)
		end

end
