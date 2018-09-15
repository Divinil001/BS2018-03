note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	make

feature

	date: TIME

	owner: PERSON

	subject: STRING

	place: STRING

	make (a_date: TIME a_owner: PERSON a_subject: STRING a_place: STRING)
		do
			date := a_date
			owner := a_owner
			subject := a_subject
			place := a_place
		end

	set_date (a_date: TIME)
		do
			date := a_date
		end

	set_owner (a_owner: PERSON)
		do
			owner := a_owner
		end

	set_subject (a_subject: STRING)
		do
			subject := a_subject
		end

	set_place (a_place: STRING)
		do
			place := a_place
		end

end
