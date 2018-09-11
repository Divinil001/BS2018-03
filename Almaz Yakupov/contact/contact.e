	note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

create
	fill_contact

feature
	name: STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING
	call_emergency: detachable CONTACT

feature
	fill_contact(i_name: STRING; i_phone_number: INTEGER; i_work_place: STRING; i_email: STRING; i_call_emergency: detachable CONTACT)
		do
			name := i_name
			phone_number := i_phone_number
			work_place := i_work_place
			email := i_email
			call_emergency := i_call_emergency
		end

feature
	remove_call_emergency()
		do
			call_emergency := Void
		end

feature
	set_call_emergency(i_call_emergency: detachable CONTACT)
		do
			call_emergency := i_call_emergency
		end

feature
	set_name(i_name: STRING)
		do
			name := i_name
		end

feature
	set_phone_number(i_phone_number: INTEGER)
		do
			phone_number := i_phone_number
		end

feature
	set_work_place(i_work_place: STRING)
		do
			work_place := i_work_place
		end

feature
	set_email(i_email: STRING)
		do
			email := i_email
		end

end
