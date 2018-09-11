note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

feature
	create_entry(date: TIME owner: PERSON subject: STRING place: STRING): ENTRY
	local
		entry: ENTRY
	do
		create entry.make(date, owner, subject, place)
		Result := entry
	end

	edit_subject(e: ENTRY new_subject: STRING)
	do
		e.set_subject(new_subject)
	end

	edit_date(e: ENTRY new_date: DATE)
	do

	end

	get_owner_name(e: ENTRY): STRING
	do
		Result := e.owner.name
	end

	in_conflict(e1: ENTRY e2: ENTRY): BOOLEAN
	do
		Result := e1.date = e2.date
	end

end
