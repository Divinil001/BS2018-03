note
	description: "Range application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
	local
		range1: RANGE
		range2: RANGE
		do
			create range1.make(5, 6)
			create range2.make(3, 2)

			print("%N%N -- Fresh run ---%N")
			io.put_boolean(range1.is_super_range_of(range2))
			print("%N")
		end

end
