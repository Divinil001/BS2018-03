note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY

feature
	events: LIST[ENTRY]
	date: INTEGER

feature
	set_date(d: INTEGER)
		do
			date:=d
		end

	set_event(e: ENTRY)
		do
			events.extend(e)
		end
end
