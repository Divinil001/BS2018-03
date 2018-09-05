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


feature

	c : COURSE
	name : STRING
	schedule : STRING
	id : INTEGER
	max_s: INTEGER

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			--print ("Hello Eiffel World!%N")

			Io.put_string ("The name of the course: ")
			Io.read_line
			name := Io.last_string.twin

			Io.put_string ("ID of the course: ")
			Io.read_integer
			id := Io.last_integer


			Io.put_string ("The schedule of the course: ")
			Io.read_line
			schedule := Io.last_string.twin

			Io.put_string ("A maximum number of students that can be enrolled to the course: ")
			Io.read_integer
			max_s := Io.last_integer

			if max_s < 3 then

				Io.put_string ("Please, enter the number bigger than 3: ")
				Io.read_integer
				max_s := Io.last_integer

			end

			create c.create_class(name, id, schedule, max_s)

			print("Ur crouse name is " + c.name + "%N")
			Io.put_string ("Ur course id is ")
			Io.put_integer (c.id)
			Io.new_line
			print("Ur crouse name is " + c.schedule + "%N")
			Io.put_string ("A max number of students in ur course is ")
			Io.put_integer (c.max_number_of_students)
			Io.new_line


		end


end
