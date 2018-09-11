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

feature-- Initialization

	new_course:COURSE


	make
			-- Run application.
		do
			create new_course.create_class("Calculus",1801,"Wednesdays all day",150,2)
			print(new_course.identifier)
		end

end
