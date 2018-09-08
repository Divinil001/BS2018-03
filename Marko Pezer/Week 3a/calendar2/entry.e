note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	create_new_entry

feature

	owner: PERSON assign set_owner
	date: TIME assign set_date
	subject: STRING assign set_subject
	place: STRING assign set_place

feature
	create_new_entry (new_owner: PERSON; new_date: TIME; new_subject: STRING; new_place: STRING)
	do
		set_owner (new_owner)
		set_date (new_date)
		set_subject (new_subject)
		set_place (new_place)
	end

feature

	set_owner (new_owner: PERSON)
	do
		owner := new_owner
	end

	set_date (new_date: TIME)
	do
		date := new_date
	end

	set_subject (new_subject: STRING)
	do
		subject := new_subject
	end

	set_place (new_place: STRING)
	do
		place := new_place
	end

	-- Print Entry

	print_entry: STRING

	local
		answer: STRING
	do
		answer := ""

		answer.append ("   - Time:     " + date.formatted_out ("hh12:[0]mi") + "%N")
		answer.append ("   - Owner:    " + owner.name + "%N")
		answer.append ("   - Subject:  " + subject + "%N")
		answer.append ("   - Location: " + place + "%N")

		result := answer
	end
end
