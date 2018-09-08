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

	entry1, entry2, entry3:ENTRY
	calendar:CALENDAR
	t1,t2:TIME
	person:PERSON

	i:INTEGER

	conflicts:ARRAY[ENTRY]

	make
			-- Run application.
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")

			create calendar.create_calendar(31)
			create conflicts.make_empty
			create t1.make_now
			create t2.make_now

			--create 2 persons and 2 new entries
			create person.create_person("Max", 89229334084, "Student", "maxitoshs@gmail.com")
			entry1:=calendar.create_entry (t1.origin, person, "NEW ENTRY INN CALEDAR", "Innopolis")
			create person.create_person ("Alex", 88005553535, "Studetn", "LEHA@LEHA.com")
			entry2:=calendar.create_entry (t2.origin, person, "HIS ENTRY", "Innopolis")

			--print info
			entry1.print_entry_info
			entry2.print_entry_info

			--adding new entries to calendar
			calendar.add_entry (entry1, 1)
			calendar.add_entry (entry2, 1)

			print("**************************************************************************"+"%N")

			--check for conflicts in selected day
			conflicts:=calendar.in_coflict (1)

			from
				i := 1
			until
				i >= conflicts.count / 2 + 1
			loop

				if
					attached{STRING} conflicts.at (i*2 - 1).place as pl1 and attached{STRING} conflicts.at (i*2).place as pl2
				then
					print("ENTRIES are in coflict: 1)Date: " + conflicts.at (i*2 - 1).date.out + " Place: " + pl1.out + " 2)Date: " + conflicts.at (i*2).date.out + " Place: " + pl2.out + "%N")
				end
				i := i + 1
			end

			print("**************************************************************************"+"%N")

			--changing time of the second entry to see the difference in "in_coflict" query
			t2.set_hour(15)
			entry2.set_date (t2)
			entry1.print_entry_info
			entry2.print_entry_info

			print("**************************************************************************"+"%N")

			--check for conflicts if place and time the same
			conflicts:=calendar.in_coflict (1)

			from
				i := 1
			until
				i >= conflicts.count / 2 + 1
			loop

				if
					attached{STRING} conflicts.at (i*2 - 1).place as pl1 and attached{STRING} conflicts.at (i*2).place as pl2
				then
					print("ENTRIES are in coflict: 1)Date: " + conflicts.at (i*2 - 1).date.out + " Place: " + pl1.out + " 2)Date: " + conflicts.at (i*2).date.out + " Place: " + pl2.out+"%N")
				end
				i := i + 1
			end

			print("**************************************************************************"+"%N")

			entry3:=calendar.create_entry (t1.origin, person, "ENTRY FOR SOME DAY", "Innopolis")
			entry3.print_entry_info
			calendar.add_entry (entry3, 5)

			--printing all month data
			print(calendar.printable_month)
		end

end
