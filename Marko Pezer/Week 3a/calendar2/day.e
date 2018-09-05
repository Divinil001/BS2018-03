note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY

create
	create_new_day

feature
	date: INTEGER
	events: ARRAYED_LIST[ENTRY]

feature

	create_new_day (new_date: INTEGER)
	do
		date := new_date
		create events.make(0)
	end

	add_event (new_event: ENTRY)
	do
		events.extend (new_event)
	end

end
