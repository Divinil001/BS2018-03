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

feature {NONE} -- Initialization
	vector:VECTOR_OPER
	check1, check2:ARRAY[INTEGER]

	make
			-- Run application.
		do
			--| Add your code here
			create vector.make

			create check1.make_filled (2, 0, 2)
			create check2.make_filled (3, 0, 2)

			print(vector.cross_product (check1,check2))

		end

end
