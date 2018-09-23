note
	description: "calendar1 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			local
			c1, c2: ENTRY
			e: CALENDAR
			a_date: DATE_TIME  -- the date of the event;
			a_owner: PERSON  -- the person who created the event;
			a_subject: STRING -- a description of the event;
			a_place: STRING
			new_subject: STRING
			new_date: DATE_TIME

			do
				create a_date.make (2008, 07, 08, 13, 37, 15)

				create a_owner.make ("Alisa", 12345678, "Innopolis University", "a.ivanova@innopolis")

				create a_subject.make_from_string ("Birthday")

				create a_place.make_from_string ("Innopolis University")

				create e

				c1 := e.create_entry(a_date, a_owner, a_subject, a_place)

				print(c1.subject)

				create new_subject.make_from_string ("Anniversary")

				e.edit_subject (c1, new_subject)

				print(c1.subject)

				create new_date.make (2009, 12, 3, 4, 20, 1)

				e.edit_date (c1, new_date)

				print(c1.date)

				print(e.get_owner_name (c1))


				create a_date.make (2009, 12, 3, 4, 20, 1)

				create a_owner.make ("Asan", 654321, "Innopolice University ", "asan@innopolis")

				create a_subject.make_from_string ("Funreal")

				create a_place.make_from_string ("Innopolice University")

				c2 := e.create_entry(a_date, a_owner, a_subject, a_place)

				if
					e.in_conflict (c1, c2)
				then
					print("YES")
				else
					print("NO")


				end




			end

end