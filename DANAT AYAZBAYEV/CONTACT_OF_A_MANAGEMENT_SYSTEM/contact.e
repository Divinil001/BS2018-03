note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

create
	eiffel_studio

feature
	name : STRING assign set_name
	set_name(new_name: STRING)
		do
			name := new_name
		end

	phone_number : INTEGER_64 assign set_phone_number
	set_phone_number (new_phone_number : INTEGER_64)
		do
			phone_number := new_phone_number
		end

	work_place : STRING assign set_work_place
	set_work_place (new_work_place : STRING)
		do
			work_place := new_work_place
		end

	email : STRING assign set_email
	set_email (new_email : STRING)
		do
			email := new_email
		end

	emergency_contact : detachable CONTACT assign set_emergency_contact
	set_emergency_contact (new_emergency_contact : detachable CONTACT)
		do
			emergency_contact := new_emergency_contact
		end

feature
	eiffel_studio (new_name : STRING; new_phone_number : INTEGER_64; new_work_place : STRING; new_email : STRING)
		do
			name := new_name
			phone_number := new_phone_number
			work_place := new_work_place
			email := new_email
			emergency_contact := void
		end
end
