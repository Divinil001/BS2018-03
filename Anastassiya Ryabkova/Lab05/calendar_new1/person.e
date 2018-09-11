note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature --reading variable

	name: STRING_8 assign set_name

	phone_number: INTEGER_32 assign set_number

	work_place: STRING_8 assign set_work

	email: STRING_8 assign set_email

	make (a_name: STRING_8; a_phone: INTEGER_32; a_work: STRING_8; a_email: STRING_8)
			--setters
		do
			set_name (a_name)
			set_number (a_phone)
			set_work (a_work)
			set_email (a_email)
		end

feature

	set_name (a_name: STRING_8)
		do
			name := a_name
		end

	set_number (a_number: INTEGER_32)
		do
			phone_number := a_number
		end

	set_work (a_work: STRING_8)
		do
			work_place := a_work
		end

	set_email (a_email: STRING_8)
		do
			email := a_email
		end

end -- class PERSON


