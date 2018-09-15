note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	make

feature

	date: TIME assign set_date

	owner: PERSON

	subject: STRING_8 assign set_subject

	place: STRING_8 assign set_place

	make (a_date: TIME; a_owner: PERSON; a_subject: STRING_8; a_place: STRING_8)
		do
			set_date (a_date)
			set_owner (a_owner)
			set_subject (a_subject)
			set_place (a_place)
		end

feature --setters

	set_date (a_date: TIME)
		do
			date := a_date
		end

	set_subject (a_subject: STRING_8)
		do
			subject := a_subject
		end

	set_place (a_place: STRING_8)
		do
			place := a_place
		end

	set_owner (a_owner: PERSON)
		do
			create owner.make ("Nastya", 123456789, "Innopolis", "a.ryabkova@innopolis.university")
		end

end -- class ENTRY


