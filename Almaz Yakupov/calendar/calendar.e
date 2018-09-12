note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

feature
	create_entry(i_date: STRING; i_owner: PERSON; i_subject: STRING; i_place: STRING): ENTRY
		local
			cash: ENTRY
		do
			create cash.set (i_date, i_owner, i_subject, i_place)
			Result := cash
		end

feature
	edit_subject(e: ENTRY; new: STRING)
		do
			e.set_subject(new)
		end

feature
	edit_date(e: ENTRY; new: STRING)
		do
			e.set_date(new)
		end

feature
	get_owner_name(e: ENTRY): STRING
		do
			Result := e.get_owner_name
		end

feature
	in_conflict(e1: ENTRY; e2: ENTRY): BOOLEAN
		local
			d1: STRING
			d2: STRING
		do
			d1 := e1.get_date
			d2 := e2.get_date
			Result := d1.is_equal (d2)
		end

end
