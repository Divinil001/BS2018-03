note
	description: "matrix application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	opers : MATRIX_OPER
	m1, m2:ARRAY2[INTEGER]
--	test : ARRAY2[INTEGER]
	i,j :INTEGER

	make
		do
			create opers
			create m1.make_filled(2, 5, 5)
			create m2.make_filled(4, 3 ,2)

			m1[1, 1] := 5
			m1[1, 2] := 4
			m1[1, 3] := 3
			m1[1, 4] := 4
			m1[1, 5] := 4
			m1[2, 1] := 1
			m1[2, 2] := 3
			m1[2, 3] := 3
			m1[2, 4] := 7
			m1[2, 5] := 4
			m1[3, 1] := 1
			m1[3, 2] := 4
			m1[3, 3] := 8
			m1[3, 4] := 8
			m1[3, 5] := 4
			m1[4, 1] := 7
			m1[4, 2] := 7
			m1[4, 3] := 7
			m1[4, 4] := 7
			m1[4, 5] := 4
			m1[5, 1] := 1
			m1[5, 2] := 2
			m1[5, 3] := 3
			m1[5, 4] := 4
			m1[5, 5] := 5


			opers.matrix_out (m1)

			i := opers.determ (m1, m1.height)

			print(i)
		end

end
