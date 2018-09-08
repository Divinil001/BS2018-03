note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	init_person

feature
	name : STRING
	phone_number : INTEGER
	work_place : STRING
	email : STRING

feature
	init_person (name_of : STRING; telephone : INTEGER; work_is_at : STRING; email_of : STRING)
		do
			set_name(name_of)
			set_phone_number(telephone)
			set_work_place(work_is_at)
			set_email(email_of)
		end
	get_name_of_owner : STRING
		do
			Result := name
		end
	set_name (it_is_name : STRING)
		do
			name := it_is_name
		end
	set_phone_number (it_is_number : INTEGER)
		do
			phone_number := it_is_number
		end
	set_work_place (it_is_work_place : STRING)
		do
			work_place := it_is_work_place
		end
	set_email (it_is_email : STRING)
		do
			email := it_is_email
		end
end
