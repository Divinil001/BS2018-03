note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	init

feature

	init
		do
			name := ""
			work_place := ""
			email := ""
		end

	set_person(n:STRING; p:INTEGER; w:STRING; e:STRING)
		do
			name := n
			phone_number := p
			work_place := w
			email := e
		end

	name:STRING

	phone_number:INTEGER

	work_place:STRING

	email:STRING

	set_name(n:STRING)
		do
			name := n
		end

	set_phone_number(n:INTEGER)
		do
			phone_number := n
		end

	set_work_place(n:STRING)
		do
			work_place := n
		end

	set_email(n:STRING)
		do
			email := n
		end

end
