note
	description: "RANGE application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	r1: RANGE
	empty: RANGE
	r2: RANGE
	r3: RANGE
	r4: RANGE
	r5: RANGE
	r6: RANGE
	make
			-- Run application.
		do
			create r1.make (1, 5)
			create r2.make (-1, 3)
			create r3.make (4, 6)
			create r4.make (3, 4)
			create r5.make (-5, 5)
			create r6.make (10, 20)
			create empty.make (1, -1)
			print(r1.overlaps (r2))
			print("%N")
			print(r1.is_sub_range_of (r5))
			print("%N")
			print(r1.is_super_range_of (r4))
		end

end
