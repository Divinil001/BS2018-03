note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	init

feature
	date : TIME
	owner : PERSON
	subject : STRING
	place : STRING

feature
	init (new_date : TIME; new_owner : PERSON; new_subject : STRING; new_place : STRING)
		do
			set_date(new_date)
			set_owner(new_owner)
			set_subject(new_subject)
			set_place(new_place)
		end
	set_subject (new_subject : STRING)
		do
			subject := new_subject
		end
	set_date (new_date : TIME)
		do
			date := new_date
		end
	set_owner (new_owner : PERSON)
		do
			owner := new_owner
		end
	set_place (new_place : STRING)
		do
			place := new_place
		end
	get_name : STRING
		do
			Result := owner.get_owner_name
		end
	get_date : TIME
		do
			Result := date
		end
	get_place : STRING
		do
			Result := place
		end
end
