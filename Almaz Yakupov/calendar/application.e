note
	description: "ace application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	calendar: CALENDAR
	p1: PERSON
	e1: ENTRY
	e2: ENTRY

feature
	make
		do
			create calendar
			create p1.set("Almaz", 123456789, "SpaceX", "mail@mail.mail")
			e1 := calendar.create_entry("01.01.01", p1, "Exam", "University")
			e2 := calendar.create_entry("01.01.01", p1, "Exam", "University")

			print(calendar.in_conflict(e1, e2).out + "%N")
		end

end
