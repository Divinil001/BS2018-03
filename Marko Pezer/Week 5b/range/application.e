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

feature {NONE}

	r1, r2, r3, r4: RANGE


	make
		do

			create r1.make (2, 5)
			create r2.make (2, 8)

			io.put_string ("R1: ")
			r1.print_range
			io.put_new_line
			io.put_string ("R2: ")
			r2.print_range
			io.put_new_line
			io.put_new_line

			io.put_string ("R1 and R2 are same: ")
			io.put_boolean (r1.is_equal_range(r2))
			io.put_new_line

			io.put_string ("R1 is subrange of R2: ")
			io.put_boolean (r1.is_sub_range_of (r2))
			io.put_new_line

			io.put_string ("R1 is super range of R2: ")
			io.put_boolean (r1.is_super_range_of (r2))
			io.put_new_line

			io.put_string ("R2 is empty: ")
			io.put_boolean (r1.is_empty)
			io.put_new_line

			io.put_string ("R1 overlaps R2: ")
			io.put_boolean (r1.overlaps (r2))
			io.put_new_line
			io.put_new_line

			io.put_string ("R3 = R1 + R2 %N")
			r3 := r1.add (r2)
			io.put_string ("R3: ")
			r3.print_range
			io.put_new_line
			io.put_new_line

			io.put_string ("R4 = R1 - R2 %N")
			r4 := r1.subtract (r2)
			io.put_string ("R4: ")
			r4.print_range
			io.put_new_line
			io.put_new_line

		end

end
