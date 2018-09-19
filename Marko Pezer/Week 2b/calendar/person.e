note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	create_person

feature

	name: STRING assign set_name
	phone_number: INTEGER assign set_phone_number
	work_place: STRING assign set_work_place
	email: STRING assign set_email

feature

	create_person (new_name: STRING; new_phone: INTEGER; new_place: STRING; new_email: STRING)
	do
		set_name (new_name)
		set_phone_number (new_phone)
		set_work_place (new_place)
		set_email (new_email)

		io.put_new_line
		io.put_string ("------------------------------------------- %N")
		io.put_string ("  New person added successfully! %N %N")
		print_person_info
		io.put_string ("------------------------------------------- %N")
		io.put_new_line
	end

	print_person_info
	do
		io.put_new_line
		io.put_string ("  PERSON INFO: %N")
		io.put_string ("  %N")

		print_name
		print_phone_number
		print_work_place
		print_email
	end

	set_name (s_name: STRING)
	do
		name := s_name
	end

	set_phone_number (s_phone: INTEGER)
	do
		phone_number := s_phone
	end

	set_work_place (s_place: STRING)
	do
		work_place := s_place
	end

	set_email (s_email: STRING)
	do
		email := s_email
	end

	print_name
	do
		io.put_string ("  Name:         " + name + "%N")
	end

	print_phone_number
	do
		io.put_string ("  Phone number: " + phone_number.out + "%N")
	end

	print_work_place
	do
		io.put_string ("  Work place:   " + work_place + "%N")
	end

	print_email
	do
		io.put_string ("  Email:        " + email + "%N")
	end

end
