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
		local
			cal:CALENDAR
			per:PERSON
			i:INTEGER
			ent:ENTRY
			temp_date:TIME

			temp_list:ARRAYED_LIST[ENTRY]
		do
			create cal.init (31)
			create per.init
			per.set_person ("John", 8800, "School", "@mail")

			across cal.days as day
				loop
					from
						i := 0
					until
						i > 2
					loop
						create temp_date.make (1, 30, 0)
						create ent.init
						ent.set_entry (temp_date, per, "Meeting", "Uni")

						cal.add_entry (ent, day.item.date)
						i := i + 1
					end
				end

			create temp_date.make (15, 0, 0)
		    create ent.init
			ent.set_entry (temp_date, per, "Lecture", "SportCenter")

			cal.add_entry (ent, 1)

			create temp_date.make (23, 0, 0)
		    create ent.init
			ent.set_entry (temp_date, per, "Lecture", "SportCenter")

			cal.add_entry (ent, 1)

			temp_list := cal.in_conflict (1)

			across temp_list as entry
				loop
					print(entry.item.date)
					print("%N")
					print(entry.item.place)
					print("%N")
					print("%N")
				end

		--	print(temp_list)
		--	print(cal.printable_month)
		end
end
