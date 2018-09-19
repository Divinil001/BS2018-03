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
	a, b, c: ARRAY2[INTEGER]
	matrix: MATRIX
	make
			-- Run application.
		do
			--| Add your code here
			create matrix
			create a.make_filled (1, 3, 3)
			create b.make_filled (2, 3, 3)
			create c.make_filled (3, 3, 3)
			print(matrix.add (a,b))
			print(matrix.minus (a,c))
			print(matrix.prod (a,b))
			print(matrix.det (a))
		end

end
