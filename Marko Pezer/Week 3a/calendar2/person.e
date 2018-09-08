note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON
create
	create_new_person

feature
	name: STRING assign set_name
	phone_number: INTEGER_64 assign set_phone_number
	work_place: STRING assign set_work_place
	email: STRING assign set_email

feature

	create_new_person (new_name: STRING; new_phone: INTEGER_64; new_work: STRING; new_email: STRING)
	do
		set_name (new_name)
		set_phone_number (new_phone)
		set_work_place (new_work)
		set_email (new_email)
	end

	set_name(new_name: STRING)
	do
		name := new_name
	end

	set_phone_number (new_phone: INTEGER_64)
	do
		phone_number := new_phone
	end

	set_work_place (new_work: STRING)
	do
		work_place := new_work
	end

	set_email (new_email: STRING)
	do
		email := new_email
	end

end
