note
	description: "UNIVERSITY application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	make
		local
		c_name: STRING
		c_id: INTEGER
		c_table: STRING
		c_capacity: INTEGER

		do
			Io.put_string ("Cource: ")
			Io.read_line
			c_name := Io.last_string.out

			Io.put_string ("ID: ")
			Io.read_integer
			c_id := Io.last_integer

			Io.put_string ("Schedule: ")
			Io.read_line
			c_table := Io.last_string.out

			Io.put_string ("Capacity of cource: ")
			Io.read_integer
			c_capacity := Io.last_integer

			create_course(c_name, c_id, c_table, c_capacity)

			print_info
		end

feature
	name: STRING
	id: INTEGER
	table: STRING
	max: INTEGER
	min: INTEGER = 3

feature
	create_course(i_name: STRING; i_id: INTEGER; i_table: STRING; i_capacity: INTEGER)
		do
			name := i_name
			id := i_id
			table := i_table
			if min > i_capacity then
				Io.put_string ("Very small count of students")
				max := min
			else
				max := i_capacity
			end
			Io.put_string ("Course_created")
		end

feature
	print_info
	do
		Io.put_string ("Course name: " + name + "%N")
		Io.put_string ("ID: " + id.out + "%N")
		Io.put_string ("Schedule: " + table + "%N")
		Io.put_string ("Capacity: " + max.out + "%N")
	end

end
