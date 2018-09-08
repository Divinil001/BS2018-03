note
	description: "calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		do

			-- Create Person 1

			io.put_string ("INPUT PERSON 1 INFO: %N%N")

			io.put_string ("Input your name: ")
			io.read_line
			nstr := io.last_string.twin

			io.put_string ("Input your phone: ")
			io.read_integer_64
			pint := io.last_integer_64.twin

			io.put_string ("Input your work place: ")
			io.read_line
			wstr := io.last_string.twin

			io.put_string ("Input your email: ")
			io.read_line
			estr := io.last_string.twin

			create person1.create_new_person (nstr, pint, wstr, estr)

			-- Create Person 2

			io.put_new_line
			io.put_string ("INPUT PERSON 2 INFO: %N%N")

			io.put_string ("Input your name: ")
			io.read_line
			nstr := io.last_string.twin

			io.put_string ("Input your phone: ")
			io.read_integer_64
			pint := io.last_integer_64.twin

			io.put_string ("Input your work place: ")
			io.read_line
			wstr := io.last_string.twin

			io.put_string ("Input your email: ")
			io.read_line
			estr := io.last_string.twin

			create person2.create_new_person (nstr, pint, wstr, estr)

			-- Create calendar

			create my_calendar.create_new_calendar

			-- Create times and dates

			create t1.make (9, 0, 0)
			create t2.make (10, 35, 0)
			create t3.make (12, 10, 0)
			create t4.make (14, 10, 0)
			create t5.make (18, 55, 0)

			create day1.create_new_day(1)
			create day2.create_new_day(2)

			-- Input events

			io.put_new_line
			io.put_string ("INPUT YOUR EVENTS AND LOCATIONS: %N%N")

			io.put_string ("Input Event 1: ")
			io.read_line
			a := io.last_string.twin

			io.put_string ("Input Event 1 location: ")
			io.read_line
			a1 := io.last_string.twin

			io.put_string ("Input Event 2: ")
			io.read_line
			b := io.last_string.twin

			io.put_string ("Input Event 2 location: ")
			io.read_line
			b1 := io.last_string.twin

			io.put_string ("Input Event 3: ")
			io.read_line
			c := io.last_string.twin

			io.put_string ("Input Event 3 location: ")
			io.read_line
			c1 := io.last_string.twin

			io.put_string ("Input Event 4: ")
			io.read_line
			d := io.last_string.twin

			io.put_string ("Input Event 4 location: ")
			io.read_line
			d1 := io.last_string.twin

			io.put_string ("Input Event 5: ")
			io.read_line
			e := io.last_string.twin

			io.put_string ("Input Event 5 location: ")
			io.read_line
			e1 := io.last_string.twin

			-- Create events

			entry1 := my_calendar.create_entry (person1, t1, a, a1)
			entry2 := my_calendar.create_entry (person1, t2, b, b1)
			entry3 := my_calendar.create_entry (person2, t3, c, c1)
			entry4 := my_calendar.create_entry (person2, t4, d, d1)
			entry5 := my_calendar.create_entry (person2, t5, e, e1)

			-- Add days to calendar

			my_calendar.add_day(day1)
			my_calendar.add_day(day2)

			-- Add events

			my_calendar.add_entry (entry1, 1)
			my_calendar.add_entry (entry3, 1)
			my_calendar.add_entry (entry5, 1)
			my_calendar.add_entry (entry1, 2)
			my_calendar.add_entry (entry2, 2)
			my_calendar.add_entry (entry4, 2)

			-- Output

			io.put_string (my_calendar.output_all)

		end

		a,b,c,d,e,a1,b1,c1,d1,e1: STRING
		person1, person2: PERSON
		nstr, wstr, estr: STRING
		pint: INTEGER_64
		my_calendar: CALENDAR
		t1, t2, t3, t4, t5: TIME
		entry1, entry2, entry3, entry4, entry5: ENTRY
		day1, day2 : DAY
end
