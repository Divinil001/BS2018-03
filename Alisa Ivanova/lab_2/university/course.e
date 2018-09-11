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
	name: STRING
	inditifier: INTEGER
	schedule: STRING
	maximum_number_of_students: INTEGER

	create_class(a_name: STRING; a_inditifier: INTEGER; a_schedule: STRING; a_maximum_number_of_students: INTEGER)
		require
			minimum_num_of_students: a_maximum_number_of_students >= 3
		do
			name:= a_name
			inditifier:= a_inditifier
			schedule:= a_schedule
			maximum_number_of_students:= a_maximum_number_of_students
		end


end
