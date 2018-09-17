note
	description: "Vectors application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	a, b: ARRAY[INTEGER]
	vector: VECTOR
	make
			-- Run application.
		do
			--| Add your code here
			create vector
			create a.make_filled (1, 1, 3)
			create b.make_filled (2, 1, 3)
			print("%N")
			print(vector.cross_product(a,b))
			print("%N")
			print(vector.doc_product(a,b))
			print("%N")
			print(vector.triangle_area(a,b))
			print("%N")
		end
end
