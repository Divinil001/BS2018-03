note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	set

feature
	name:STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING

feature
	set(i_name: STRING; i_phone_number: INTEGER; i_work_place: STRING; i_email: STRING)
		do
			name := i_name
			phone_number := i_phone_number
			work_place := i_work_place
			email := i_email
		end

feature
	set_name(i_name: STRING)
		do
			name := i_name
		end

feature
	set_phone_number(i_phone_number: INTEGER)
		do
			phone_number := i_phone_number
		end

feature
	set_work_place(i_work_place: STRING)
		do
			work_place := i_work_place
		end

feature
	set_email(i_email: STRING)
		do
			email := i_email
		end

feature
	get_name(): STRING
		do
			Result := name
		end

end
