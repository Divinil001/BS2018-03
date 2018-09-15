note
	description: "Calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE}

	cal: CALENDAR
	p1: PERSON
	p2: PERSON
	e1: ENTRY
	e2: ENTRY
	t: TIME

	make
		do
			create cal

			create p1.make("Person1", 1234567890, "Innopolis", "person1@innopolis.university")
			create p2.make("Person2", 1234567891, "Innopolis", "person2@innopolis.university")

			create t.make(12, 0, 0)

			e1 := cal.create_entry(t, p1, "Subject1", "Place1")
			e2 := cal.create_entry(t, p1, "Subject2", "Place2")

			cal.edit_subject(e1, "New subject1")

			print(cal.in_conflict (e1, e2))
		end

end
