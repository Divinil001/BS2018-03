note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature

	name: STRING assign set_name 	-- the name of the person;
	phone_number: INTEGER_64 assign set_phone_number -- a 10 digit number. The phone number of the contact;
	work_place: STRING assign set_work_place -- the work place of the contact;
	email: STRING assign set_email -- the email of the contact.

	make(a_name:STRING; a_phone_number:INTEGER_64; a_work_place:STRING; a_email:STRING)
		do
			name := a_name
			phone_number := a_phone_number
			work_place := a_work_place
			email := a_email

		end

	set_name(a_name:STRING)
		do
			name:= a_name
		end

	set_phone_number(a_phone_number:INTEGER_64)
		do
			phone_number:= a_phone_number
		end

	set_work_place(a_work_place:STRING)
		do
			work_place:= a_work_place
		end

	set_email(a_email:STRING)
		do
			email:= a_email
		end



end
