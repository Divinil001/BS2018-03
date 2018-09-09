note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature
	make
	do
		edit_contact("", 0, "", "")
	end

	edit_contact(nname:STRING; nphone: INTEGER; nwork_place: STRING; nemail: STRING)
	do
		set_name(nname)
		set_phone(nphone)
		set_work_place(nwork_place)
		set_email(nemail)
	end

feature
	name: STRING
	phone: INTEGER
	work_place: STRING
	email: STRING

feature
	set_name(new_name: STRING)
	do
		name := new_name
	end

	set_phone(new_phone: INTEGER)
	do
		phone := new_phone
	end

	set_work_place(new_work_place: STRING)
	do
		work_place := new_work_place
	end

	set_email(new_email: STRING)
	do
		email := new_email
	end

end
