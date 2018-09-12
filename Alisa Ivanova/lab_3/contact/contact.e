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

	name: STRING 		    	-- the name of the contact;
	phone_number: STRING	    -- a 10 digit number. The phone number of the contact;
	work_place: STRING			-- the work place of the contact;
	email: STRING				-- the email of the contact;
	call_emergency: detachable CONTACT		-- the contact person to call in case of an emergency

	create_contact(a_name:STRING; a_phone_number:STRING; a_work_place:STRING; a_email:STRING)

		do
			set_name(a_name)
			set_phone_number(a_phone_number)
			set_work_place(a_work_place)
			set_email(a_email)
			call_emergency := Void
		end

	set_name(a_name:STRING)
		do
			name:= a_name
		end

	set_phone_number(a_phone_number:STRING)
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

	set_call_emergency(a_call_emergency: detachable CONTACT)
		do
			call_emergency:= a_call_emergency
		end


end
