note
	description: "range application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	r1,r2,r3:RANGE

	make
			-- Run application.
		do
			--| Add your code here
			create r1.create_range(1,3)
			create r2.create_range(4,6)
			create r3.create_range(1,4)

			print("r1: left=" + r1.left.out + " right=" + r1.right.out + " r2: left=" + r2.left.out + " right=" + r2.right.out + " r3: left=" + r3.left.out + " right=" + r3.right.out + "%N")

			print("Is equal r1 and r2: " + r1.is_equal_range (r2).out + "%N")
			print("Is empty r1: " + r1.is_empty.out + "%N")
			print("Is empty r2: " + r2.is_empty.out + "%N")
			print("Is r1 is sub of r2: " + r1.is_sub_range_of (r2).out + "%N")
			print("Is r1 is super of r2: " + r1.is_super_range_of (r2).out + "%N")
			print("Does r1 have left overlap with r2: " + r1.left_overlaps (r2).out + "%N")
			print("Does r1 have right overlap with r2: " + r1.right_overlaps (r2).out + "%N")
			print("Do r1 and r2 overlap: " + r1.overlaps (r2).out + "%N")
			r1 := r1.add (r2)
			print("Add r1 to r2: " + "left=" + r1.left.out + " right=" + r1.right.out + "%N")
			r1 := r1.subtract (r3)
			print("Substract r3 from r1: " + " left=" + r1.left.out + " right="+ r1.right.out +"%N")

		end

end
