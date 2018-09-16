note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

create
	create_contact

feature

	name: STRING assign set_name
	phone_number: INTEGER assign set_phone_number
	work_place: STRING assign set_work_place
	email: STRING assign set_email
	call_emergency: detachable CONTACT

feature

	create_contact (new_name: STRING; new_phone: INTEGER; new_work: STRING; new_email: STRING)
	do

		set_name (new_name)
		set_phone_number (new_phone)
		set_work_place (new_work)
		set_email (new_email)
		call_emergency := void

		io.put_string ("%NNew contact created successfully! %N")

	end

	set_name (new_name: STRING)
	do
		name := new_name
	end

	set_phone_number (new_phone: INTEGER)
	do
		phone_number := new_phone
	end

	set_work_place (new_place: STRING)
	do
		work_place := new_place
	end

	set_email (new_email: STRING)
	do
		email := new_email
	end

	add_emergency (new_emergency: CONTACT)
	do
		call_emergency := new_emergency
	end

	remove_emergency
	do
		call_emergency := void
	end

end
