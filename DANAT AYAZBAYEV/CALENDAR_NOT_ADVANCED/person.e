note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create make

feature {NONE} -- Initialize
	make (a_name : STRING; a_phone_number : INTEGER_64; a_work_place : STRING; an_email : STRING)
		do
			owner_name := a_name
			phone_number := a_phone_number
			work_place := a_work_place
			email := an_email
		end

feature
	owner_name : STRING
	phone_number : INTEGER_64
	work_place : STRING
	email : STRING

	get_owner_name : STRING
		do
			Result := owner_name
		end
end
