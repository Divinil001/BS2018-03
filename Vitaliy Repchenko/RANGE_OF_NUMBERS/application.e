note
	description: "RANGE_OF_NUMBERS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	a,b,c : RANGE


	make
			-- Run application.
		do
			--| Add your code here
			create a.make (1, 5)
			create b.make (1, 6)
			create c.make (1, 0)
			print("%N")
			print(a.is_equal_range (a))
			print("%N")
			print(a.is_equal_range (b))
			print("%N")
			print(c.is_empty)
			print("%N")
			print(a.is_sub_range_of(b))
			print("%N")
			print(a.is_super_range_of (b))
			print("%N")
			print(a.left_overlaps (b))
			print("%N")
			print(a.right_overlaps (b))
			print("%N")
			print(a.overlaps (b))
			print("%N")
			print(a.add (b))
			print("%N")
			print(a.subtract (b))
			print("%N")
		end

end
