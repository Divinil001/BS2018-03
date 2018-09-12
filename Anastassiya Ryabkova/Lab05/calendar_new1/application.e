note
	description: "calendar_new application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	person:PERSON
	day, day1:DAY
	e, e1:ENTRY


	a_date: DATE_TIME


	a_subject: STRING_8


	a_place: STRING_8
	calendar:CALENDAR1

	make
			-- Run application.
		do
			--| Add your code here


			create a_date.make (2018, 12, 13, 5, 3, 0)--creation of first entry
			create person.make ("Anastassiya",123456789, "Innopolis", "a.ryabkova@innopolis.university")
			create a_subject.make_from_string ("Birthday")
			create a_place.make_from_string ("Innopolis University")
			create e.make(a_date, person, a_subject, a_place)

			create day.make (12, e) --creation of first day
			create calendar.set_days(day)


			create a_date.make (2008, 7, 8, 13, 37, 15) --creation second entry
			create person.make ("Galya",987654321, "Dorm", "g.shlyaga@innopolis.university")
			create a_subject.make_from_string ("Quiz")
			create a_place.make_from_string ("Innopolis")
			create e1.make(a_date, person, a_subject, a_place)

			create day1.make (24, e1) -- creation of second day
			calendar.set_days(day1)

			calendar.add_entry(e,day)

			calendar.edit_subject(e, "Midterm")
			print(calendar.get_owner_name(e))


		end

end
