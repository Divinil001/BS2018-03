note
	description: "Summary description for {COURSE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COURSE

create
	create_class

feature
	name : STRING
	identifier : INTEGER
	schedule : STRING
	max_number : INTEGER

feature
	create_class (course_name : STRING; course_identifier : INTEGER; course_schedule : STRING; course_max_number : INTEGER)
		do
			name := course_name
			identifier := course_identifier
			schedule := course_schedule
			max_number := course_max_number
		end
end
