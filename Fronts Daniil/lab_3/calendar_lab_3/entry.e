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
	make
	do
		create date.make_now
		create owner.make
		subject := ""
		place := ""
	end

feature
	date: TIME
	owner: PERSON
	subject: STRING
	place: STRING


feature
	edit_entry(ndate: TIME; nowner: PERSON; nsubject: STRING; nplace: STRING)
	do
		set_date(ndate)
		set_owner(nowner)
		set_subject(nsubject)
		set_place(nplace)
	end

	set_date(new_date: TIME)
	do
		date := new_date
	end

	set_owner(new_owner: PERSON)
	do
		owner := new_owner
	end

	set_subject(new_subject: STRING)
	do
		subject := new_subject
	end

	set_place(new_place: STRING)
	do
		place := new_place
	end
end
