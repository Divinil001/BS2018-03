note
	description: "University application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	COURSE

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create_class("Introduction to Programming I", 1801, "Wednesdays all day", 5)
			io.put_string (name)
			io.new_line
			io.put_integer (identifier)
			io.new_line
			io.put_string (schedule)
			io.new_line
			io.put_integer (number)
		end
feature

	create_class(n_p: STRING; i_p: INTEGER; s_p: STRING; num_p: INTEGER)

		do
			set_name(n_p)
			set_identifier(i_p)
			set_schedule(s_p)
			set_number(num_p)
		end
	set_name(n: STRING)
		do
			name :=n
		end
	name: STRING

	set_identifier(i:INTEGER)
		do
			identifier:=i
		end
	identifier: INTEGER

	set_schedule(s:STRING)
		do
			schedule:=s
		end
	schedule: STRING

	set_number(num:INTEGER)
		do
			if
				num>=3
			then
				number:=num
			end
		end
	number: INTEGER
end
