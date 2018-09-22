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

feature {NONE} -- Initialization
	range:RANGE
	range1:RANGE

	make
			-- Run application.
		do
			--| Add your code here
			create range.set_range (1,4)
			create range1.set_range (3,5)

			print(range.is_equal_range (range1))
			io.new_line

			print(range.is_empty)
			io.new_line

			print(range.left_overlaps (range1))
			io.new_line

			print(range.right_overlaps (range1))
			io.new_line

			print(range.overlaps (range1))
			io.new_line

			print(range.add (range1))
			io.new_line

			print(range.subtract (range1))

		end

end
