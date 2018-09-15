note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON
create make

feature --reading variable
	name: STRING assign set_name
	phone_number: INTEGER assign set_number
	work_place: STRING assign set_work
	email: STRING assign set_email
	make(a_name:STRING; a_phone:INTEGER; a_work:STRING; a_email:STRING)
	do

		set_name(a_name)
		set_number(a_phone)
		set_work(a_work)
		set_email(a_email)

	end
feature --setters
	set_name(a_name:STRING)
		do
			name:=a_name
		end

	set_number(a_number:INTEGER)
		do
			phone_number:=a_number
		end

	set_work(a_work:STRING)
		do
			work_place:=a_work
		end

	set_email(a_email:STRING)
		do
			email:=a_email
		end

end
