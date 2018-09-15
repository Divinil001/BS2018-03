note
	description: "university application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	COURSE

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

		name: STRING
		indetifier: INTEGER
		schedule: STRING
		max_student: INTEGER


	make
			-- Run application.
		do
			--| Add your code here


			io.put_string ("Enter name of cource:")
			io.new_line
			io.read_line
			set_name(Io.last_string)

			io.put_string ("Enter id of course:")
			io.new_line
			io.read_integer
			set_id(Io.last_integer)

			io.put_string ("Enter schedule of cource:")
			io.new_line
			io.read_line
			set_schedule(Io.last_string)

			io.put_string ("Enter maximum of student:")
			io.new_line
			io.read_integer
			set_id(Io.last_integer)
			create_class
		end
--Initialize variables by constructor
	set_name( a_name:STRING)
	do
		name := a_name
	end

	set_id( a_ID: INTEGER)
	do
		indetifier := a_ID
	end

	set_schedule( a_schedule: STRING)
	do
		schedule := a_schedule
	end

	set_max( a_max: INTEGER)
	do
		max_student := a_max
	end


feature --creation of the course
	current_number_of_student: INTEGER
	create_class
		do

			io.put_string ("How many students will enroll on the course?")
			io.new_line
			io.read_integer
			current_number_of_student := io.last_integer
			if current_number_of_student >= 3 then
				io.put_string ("You succesfully create course")
			else
				io.put_string ("You cannot create course")

			end
		



		end
		end
