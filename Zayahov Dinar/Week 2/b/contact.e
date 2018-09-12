note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT
create
	set_name,set_work_place, set_email, set_call_emergency


feature
	-- Run application.
	name: STRING
	phone_number:  INTEGER
	work_place:  STRING
	email:  STRING
	call_emergency:  CONTACT

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

	set_call_emergency(ce: CONTACT)
		do
			call_emergency:=ce
		end
end
