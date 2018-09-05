note
	description: "calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	entry1:ENTRY
	entry2:ENTRY
	calendar:CALENDAR
	t:TIME
	person:PERSON

	make
			-- Run application.
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")

			create calendar
			create t.make_now
			create person.create_person("Max", 89229334084, "Student", "maxitoshs@gmail.com")
			entry1:=calendar.create_entry (t.origin, person, "NEW ENTRY INN CALEDAR", Void)
			create person.create_person ("Alex", 88005553535, "Studetn", "LEHA@LEHA.com")
			entry2:=calendar.create_entry (t, person, "HIS ENTRY", "Innopolis")

			entry1.print_entry_info
			entry2.print_entry_info

			calendar.edit_subject (entry1, "UPDATED SUBJECT")
			entry1.print_entry_info

			t.set_hour (15)
			entry2.set_date (t)
			entry2.print_entry_info

			print(calendar.in_coflict (entry1, entry2).out)

		end

end
