note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	entry_init

feature
	the_date : THE_TIME
	owner : PERSON
	subject : STRING
	place : STRING

feature
	entry_init (the_date_of : THE_TIME; owner_of : PERSON; subject_of : STRING; place_of : STRING)
		do
			edit_the_date(the_date_of)
			edit_the_owner(owner_of)
			edit_the_subject(subject_of)
			set_place(place_of)
		end
	get_owners_name : STRING
		do
			Result := owner.get_name_of_owner
		end
	edit_the_subject (the_new_subject : STRING)
		do
			subject := the_new_subject
		end
	edit_the_date (the_new_date : THE_TIME)
		do
			the_date := the_new_date
		end
	edit_the_owner (here_is_owner : PERSON)
		do
			owner := here_is_owner
		end
	set_place (setting_place : STRING)
		do
			place := setting_place
		end
	get_subject : STRING
		do
			Result := subject
		end
	get_start_time : INTEGER
		do
			Result := the_date.get_the_start_time
		end
	get_end_time : INTEGER
		do
			Result := the_date.get_the_end_time
		end
	get_owner : PERSON
		do
			Result := owner
		end
	get_place : STRING
		do
			Result := place
		end
end
