note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	create_entry

feature

	date: STRING assign set_date
	owner: PERSON assign set_owner
	subject: STRING assign set_subject
	location: STRING assign set_location

feature

	create_entry (new_date: STRING; new_owner: PERSON; new_subject: STRING; new_place: STRING)
	do
		set_date (new_date)
		set_owner (new_owner)
		set_subject (new_subject)
		set_location (new_place)

		io.put_new_line
		io.put_string ("------------------------------------------- %N")
		io.put_string ("  New event created successfully! %N %N")
		print_event_info
		io.put_string ("------------------------------------------- %N")
		io.put_new_line
		io.put_new_line
	end

	print_event_info
	do
		io.put_new_line
		io.put_string ("  EVENT INFO: %N")
		io.put_new_line

		print_date
		print_owner
		print_subject
		print_location
	end

	set_date (s_date: STRING)
	do
		date := s_date
	end

	set_owner (s_owner: PERSON)
	do
		owner := s_owner
	end

	set_subject (s_subject: STRING)
	do
		subject := s_subject
	end

	set_location (s_place: STRING)
	do
		location := s_place
	end

	print_date
	do
		io.put_string ("  Date:         " + date + "%N")
	end

	print_owner
	do
		-- io.put_string (" Phone num: " + phone_number.out + "%N")
	end

	print_subject
	do
		io.put_string ("  Subject:      " + subject + "%N")
	end

	print_location
	do
		io.put_string ("  Location:     " + location + "%N")
	end

end
