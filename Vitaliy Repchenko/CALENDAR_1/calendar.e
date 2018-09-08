note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR
feature
	create_entry(a_date: DATE; a_owner: PERSON; a_subject: STRING; a_place: STRING):  ENTRY
		local
			qwerty:  entry
		do
			create qwerty.make(a_date, a_owner, a_subject, a_place)
			Result:= qwerty
		end

	create_person(a_name: STRING; a_phone_number: INTEGER_64; a_work_place: STRING; a_email: STRING):  PERSON
		local
			qwerty:  PERSON
		do
			create qwerty.make(a_name, a_phone_number, a_work_place, a_email)
			Result:= qwerty
		end

	edit_subject (e: ENTRY; new_subject: STRING)
		do
			e.set_subject (new_subject)
		end
	edit_date (e: ENTRY; new_date: DATE)
		do
			e.set_date (new_date)
		end
	get_owner_name (e: ENTRY): STRING
		do
			Result:= e.owner.name
		end
	in_conflict (e1, e2: ENTRY): BOOLEAN
		do
			if e1.date = e2.date or e1.place = e2.place
			then Result:= TRUE
			else Result:= FALSE
			end
		end
end
