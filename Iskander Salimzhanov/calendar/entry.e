note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY
create
	fill_in
feature {NONE}
	fill_in(a_date: DT_TIME; a_owner: PERSON; a_subject: STRING; a_place: STRING)
	do
		set_date(a_date)
		set_owner(a_owner)
		set_subject(a_subject)
		set_place(a_place)
	end
feature
	date: DT_TIME
	owner: PERSON
	subject: STRING
	place: STRING
feature
	set_date(a_date: DT_TIME)
	do
		date := a_date
	end

	set_owner(a_person: PERSON)
	do
		owner := a_person
	end

	set_subject(a_subject: STRING)
	do
		subject := a_subject
	end

	set_place(a_place: STRING)
	do
		place := a_place
	end

	to_string: STRING
	local
		string: STRING
	do
		string := date.hour.to_hex_string + "." + date.minute.to_hex_string + "." + date.second.to_hex_string + ":" + subject
		Result := string
	end
end
