class
	APPLICATION
create
	create_class

feature

	create_class
			-- Run application
		local
		name_course: STRING
		indification: INTEGER
		table: STRING
		max_num_stud: INTEGER

		do
			Io.put_string ("Course: ")
			Io.read_line
			name_course := Io.last_string.out

			Io.put_string("ID: ")
			Io.read_integer
			indification := Io.last_integer

			Io.put_string ("Schedule: ")
			Io.read_line
			table := Io.last_string.out

			Io.put_string ("Max number of students for the course: ")
			Io.read_integer
			max_num_stud := Io.last_integer
			make_course(name_course, indification, table, max_num_stud)

			print_info
		end

feature

	name: STRING
	id: INTEGER
	schedule: STRING
	max_num_students: INTEGER
	min_num_students: INTEGER = 3

feature -- create a class
	make_course(name_a: STRING; id_a: INTEGER; schedule_a: STRING; max_num_students_a: INTEGER)
			do
				name := name_a
				id := id_a
				schedule := schedule_a
				if min_num_students > max_num_students_a then
					Io.put_string("It's impossible for your amount of students" + "%N")

					max_num_students := min_num_students

				else
					max_num_students := max_num_students_a
				end

				Io.put_string ("Your course has been created%N")
			end
feature
	print_info
		do
			Io.put_string ("Course name: " + name + "%N")
			Io.put_string ("ID: " + id.out + "%N")
			Io.put_string ("Schedule: " + schedule + "%N")
			Io.put_string ("Max number of students for the course: " + max_num_students.out + "%N")
		end

end

