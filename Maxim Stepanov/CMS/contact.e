note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

create
	make

feature

	name: STRING

	phone_number: INTEGER

	work_place: STRING

	email: STRING

	call_emergency: detachable CONTACT

	make (a_name: STRING a_phone_number: INTEGER a_work_place: STRING a_email: STRING)
		do
			set_name (a_name)
			set_phone_number (a_phone_number)
			set_work_place (a_work_place)
			set_email (a_email)
			call_emergency := Void
		end

	set_name (a_name: STRING)
		do
			name := a_name
		end

	set_phone_number (a_number: INTEGER)
		require
			is_number_ok: a_number.out.count = 10
		do
			phone_number := a_number
		end

	set_work_place (a_work_place: STRING)
		do
			work_place := a_work_place
		end

	set_email (a_email: STRING)
		do
			email := a_email
		end

	set_call_emergency (a_contact: CONTACT)
		do
			call_emergency := a_contact
		end

	remove_call_emergency ()
		do
			call_emergency := Void
		end

end
