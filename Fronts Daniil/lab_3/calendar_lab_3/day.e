note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY

create
	make

feature
	make
	do
		date := 0
		index := 1
		create events.make_empty
	end

feature
	date: INTEGER
	events: ARRAY[ENTRY]
	index : INTEGER
feature
	set_date(new_date: INTEGER)
	do
		date := new_date
	end

	set_events(new_events: ARRAY[ENTRY])
	do
		events := new_events
	end

	add_entry(new_event: ENTRY)
	do
		events.force (new_event, index)
		index := index + 1
	end


end
