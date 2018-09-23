note
	description: "range application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	r1: RANGE
	r2: RANGE

feature {NONE} 
	make
			-- Testing
		do
			create r1
			create r2
			r1.make_range (6,8)
			r2.make_range (8,10)
			--print(r1.is_equal_range (r2))
			--print(r2.is_empty)
			--print(r1.is_super_range_of (r2))
			--print(r1.left_overlaps (r2))
			--print(r2.overlaps (r1))
			--print(r2.subtract(r1))
		end
end
