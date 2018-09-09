note
	description: "calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	make
		do
		
		end

feature
	create_entry (date : TIME; owner : PERSON; subject : STRING; place : STRING) : ENTRY
		local
			e : ENTRY
		do
			create e.init(date, owner, subject, place)
			Result := e
		end
	edit_subject (e : ENTRY; new_subject : STRING)
		do
			e.set_subject(new_subject)
		end
	edit_date (e : ENTRY; new_date : TIME)
		do
			e.set_date(new_date)
		end
	get_owner_name (e : ENTRY) : STRING
		do
			Result := e.get_name
		end
	in_conflict (e1 : ENTRY; e2 : ENTRY) : BOOLEAN
		do
			if e1.get_place = e2.get_place or e1.date = e2.date then
				Result := TRUE
			else
				Result := FALSE
			end
		end
end
