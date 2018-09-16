note
	description: "university application root class"
	date: "27.08.2018"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			create new_class.create_class ("Introduction to Programming I", 1801, "Wednesdays all day", 200)

			io.put_string ("Class created successfully!")
			io.put_new_line
			io.put_new_line
			io.put_string ("COURSE INFO: ")
			io.put_new_line
			io.put_string ("Name: " + new_class.Name)
			io.put_new_line
			io.put_string ("Identifier: " + new_class.Identifier.out)
			io.put_new_line
			io.put_string ("Schedule: " + new_class.Schedule)
			io.put_new_line
			io.put_string ("Maximum number of students: " + new_class.Maximum_number_of_students.out)
			io.put_new_line

		end

feature

	new_class: COURSE
end
