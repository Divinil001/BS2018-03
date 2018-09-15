note
	description: "university application root class"
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
		local
			a_course : COURSE
			-- Run application.
		do
			--| Add your code here
			create a_course.create_class("COMPUTER_ARCHITECHTURE", 99942, "THURSDAY 10:35 - 17:15", 152)
			print(a_course.name + "%N")
			print(a_course.identifier.out + "%N")
			print(a_course.schedule + "%N")
			print(a_course.max_number.out + "%N")
		end

end


