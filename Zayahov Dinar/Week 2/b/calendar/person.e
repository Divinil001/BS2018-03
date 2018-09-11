note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	set_name,set_work_place, set_email

feature
	-- Run application.
	name: STRING
	phone_number:  INTEGER
	work_place:  STRING
	email:  STRING

feature
	set_name(n:STRING)
		do
			name:=n
		end

	set_phone_number(pn: INTEGER)
		do
			phone_number:=pn
		end

	set_work_place(wp: STRING)
		do
			work_place:=wp
		end

	set_email(em: STRING)
		do
			email:=em
		end
end
