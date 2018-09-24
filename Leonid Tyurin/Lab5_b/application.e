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

	r1, r2 , r3: RANGE

	make
		do
			create r1.make(4,7)
			create r2.make(5,7)
			create r3.make(0,0)
			print("is equal range " + r1.is_equal_range (r2).out + "%N")
			print("is empty " + r1.is_empty.out + "%N")
			print("is sub range of " + r1.is_sub_range_of (r2).out + "%N")
			print("is super range of " + r1.is_super_range_of (r2).out + "%N")
			print("is left overlaps " + r1.left_overlaps (r2).out + "%N")
			print("is right overlaps " + r1.right_overlaps (r2).out + "%N")
			print("is overlaps " + r1.overlaps (r2).out + "%N")
			r3 := r1.subtract (r2)
			print(r3.left.out + " " + r3.right.out)
		end

end
