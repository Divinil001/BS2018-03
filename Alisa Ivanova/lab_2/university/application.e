note
	description: "university application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			c: COURSE
			a_name: STRING
			a_inditifier: INTEGER
			a_schedule: STRING
			a_number: INTEGER
		do
			io.put_string ("Enter course name:")
			io.read_line
			a_name:= io.last_string

			io.put_string ("Enter inditifier:")
			io.read_integer
			a_inditifier:= Io.last_integer

			io.put_string("Enter schedule:")
			io.read_line
			a_schedule:= Io.last_string

			io.put_string ("Enter number of students:")
			io.read_integer
			a_number:= Io.last_integer

			create c.create_class (a_name, a_inditifier, a_schedule, a_number)
		end

end
