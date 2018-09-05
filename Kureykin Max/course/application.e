note
	description: "course application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	itp:COURSE
	math:COURSE

	make
			-- Run application.
		do
			--| Add your code here

			create itp.create_course ("ITP", 1, "MONDAY and WEDNESDAY", 20, 16)
			create math.create_course ("CALCULUS", 2, "WEDNESDAY", 20, 2)
		end

end
