note
	description: "project_lab5b application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	range1: RANGE
	range2: RANGE

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create range1.create_range(1, 3)
			create range2.create_range(1, 9)
			io.put_new_line
			io.put_new_line
			io.put_boolean (range1.is_equal_range (range2))
			io.put_new_line
			io.put_boolean (range1.is_sub_range_of(range2))
			io.put_new_line
			io.put_boolean (range2.is_super_range_of (range1))
			io.put_new_line
			io.put_boolean (range1.left_overlaps (range2))
			io.put_new_line
			io.put_boolean (range1.overlaps (range2))
			io.put_new_line

			range1:=range1.add (range2)
			io.put_integer (range1.right)
		end

end
