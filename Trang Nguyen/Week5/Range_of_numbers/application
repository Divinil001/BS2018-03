note
	description: "range_of_numbers application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local i: INTEGER
		do
			create r1
			create r2
			r1.set_left (-10)
			r1.set_right (5)
			r2.set_left (4)
			r2.set_right (15)
			io.put_string ("%Nr1 = ")
			r1.print_range
			io.put_string ("%Nr2 = ")
			r2.print_range
			io.put_string ("%Nr1 is emmpty? ")
			io.put_boolean (r1.is_empty)
			io.put_string ("%Nr1 is equal range to r2? ")
			io.put_boolean (r1.is_equal_range (r2))
			io.put_string ("%Nr1 is sub range of r2? ")
			io.put_boolean (r1.is_sub_range_of (r2))
			io.put_string ("%Nr1 is super range of  r2? ")
			io.put_boolean (r1.is_super_range_of (r2))
			io.put_string ("%Nr1 left overlaps r2? ")
			io.put_boolean (r1.left_overlaps (r2))
			io.put_string ("%Nr1 right overlaps r2? ")
			io.put_boolean (r1.right_overlaps (r2))
			io.put_string ("%Nr1 overlaps r2? ")
			io.put_boolean (r1.overlaps (r2))
			io.put_string ("%Nr1 + r2 = ")
			from
				i := 1
			until
				i > r1.add (r2).count
			loop
				r1.add (r2).i_th (i).print_range
				print (" ")
				i := i + 1
			end
			io.put_string ("%Nr1 - r2 = ")
			from
				i := 1
			until
				i > r1.subtract (r2).count
			loop
				r1.subtract (r2).i_th (i).print_range
				print (" ")
				i := i + 1
			end
		end

feature -- Access

	r1, r2: RANGE
			-- r1, r2

end
