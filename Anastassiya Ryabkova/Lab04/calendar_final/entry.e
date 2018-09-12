note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY
create make

feature
	date: DATE_TIME assign set_date
	owner: PERSON
	subject: STRING	 assign set_subject
	place: STRING assign set_place

	make(a_date:DATE_TIME; a_owner:PERSON; a_subject:STRING; a_place: STRING)
		do

			 set_date(a_date)
			 set_owner(a_owner)
			 set_subject(a_subject)
			 set_place(a_place)

		end

feature --setters
	set_date(a_date: DATE_TIME)
		do
			date:=a_date
		end

	set_subject(a_subject:STRING)
	do
		subject:=a_subject
	end

	set_place(a_place:STRING)
	do
		place:=a_place
	end

	set_owner(a_owner:PERSON)
	do
		create owneR.make ("Nastya", 123456789, "Innopolis", "a.ryabkova@innopolis.university")
	end

end
