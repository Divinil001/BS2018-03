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

	date: DATE_TIME assign set_date -- the date of the event;
	owner: PERSON assign set_owner -- the person who created the event;
	subject: STRING assign set_subject -- a description of the event;
	place: STRING assign set_place -- a description of the place where the event will occur (if any);

	make(a_date:DATE_TIME; a_owner:PERSON; a_subject:STRING; a_place:STRING)

		do
			set_date(a_date)
			set_owner(a_owner)
			set_subject(a_subject)
			set_place(a_place)

		end

	set_date(a_date:DATE_TIME)
		do
			date:= a_date
		end

	set_owner(a_owner:PERSON)
		do
			owner:= a_owner
		end

	set_place(a_place:STRING)
		do
			place:= a_place
		end

	set_subject(a_subject:STRING)
		do
			subject:= a_subject
		end
end
