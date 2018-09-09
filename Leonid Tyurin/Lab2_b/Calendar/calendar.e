note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

feature
	create_entry(d:TIME; owner:PERSON; subj:STRING; place:STRING):ENTRY
		local
			temp:ENTRY
		do
			create temp.init
			temp.set_date (d)
			temp.set_owner (owner)
			temp.set_subject (subj)
			temp.set_place (place)
			result := temp
		end

	edit_subject(e: ENTRY; new_subject: STRING)
		do
			e.set_subject (new_subject)
		end

	edit_date(e: ENTRY; new_date: TIME)
		do
			e.set_date (new_date)
		end

	get_owner_name(e:ENTRY):STRING
		do
			result := e.owner.name
		end

	in_conflict(e1, e2:ENTRY):BOOLEAN
		do
			if
				e1.place = e2.place or e1.date = e2.date
			then
				result := true
			else
				result := false
			end
		end

end
