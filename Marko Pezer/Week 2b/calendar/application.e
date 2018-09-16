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

			io.put_string ("Input your name: ")
			io.read_line
			nstr := io.last_string.twin

			io.put_string ("Input your phone: ")
			io.read_integer
			pint := io.last_integer.twin

			io.put_string ("Input your work place: ")
			io.read_line
			wstr := io.last_string.twin

			io.put_string ("Input your email: ")
			io.read_line
			estr := io.last_string.twin

			create person1.create_person (nstr, pint, wstr, estr)

			-- Create Event 1

			io.put_string ("Input event date and time: ")
			io.read_line
			dates := io.last_string.twin

			io.put_string ("Input event description: ")
			io.read_line
			names := io.last_string.twin

			io.put_string ("Input event location: ")
			io.read_line
			places := io.last_string.twin

			create entry1.create_entry (dates, person1, names, places)

			-- Change Event 1

			io.put_string ("Change event description: ")
			io.read_line
			n_subject := io.last_string.twin
			edit_subject(entry1, n_subject)

			io.put_string ("Change event date: ")
			io.read_line
			n_date := io.last_string.twin
			edit_date(entry1, n_date)

			entry1.print_event_info

			io.put_new_line
			io.put_string ("Name of event owner is: ")
			get_owner_name(entry1)
			io.put_new_line

			-- Create Event 2

			io.put_string ("Create another event! %N")

			io.put_string ("Input event date and time: ")
			io.read_line
			dates := io.last_string.twin

			io.put_string ("Input event description: ")
			io.read_line
			names := io.last_string.twin

			io.put_string ("Input event location: ")
			io.read_line
			places := io.last_string.twin

			create entry2.create_entry (dates, person1, names, places)

			io.put_string ("Your events are in conflict: ")
			in_conflict (entry1, entry2)
			io.put_new_line

		end

		person1: PERSON
		entry1: ENTRY
		entry2: ENTRY
		nstr: STRING
		pint: INTEGER
		wstr: STRING
		estr: STRING
		dates: STRING
		names: STRING
		places: STRING
		n_subject: STRING
		n_date: STRING

		feature

			edit_subject (which_class: ENTRY; new_subject: STRING)
			do
				which_class.set_subject (new_subject)
			end

			edit_date (which_class: ENTRY; new_date: STRING)
			do
				which_class.set_date (new_date)
			end

			get_owner_name (which_class: ENTRY)
			do
				io.put_string (which_class.owner.name + "%N")
			end

			in_conflict (which_class1: ENTRY; which_class2: ENTRY)
			do
				if which_class1.date.is_equal (which_class2.date) or which_class1.location.is_equal (which_class2.location)  then
					io.put_boolean (TRUE)
				else
					io.put_boolean (FALSE)
				end
			end

end
