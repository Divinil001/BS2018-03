note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY
create
	fill_in
feature {NONE}
	fill_in(a_date: INTEGER)
	local
		eevents: ARRAYED_LIST [ENTRY]
	do
		set_date(a_date)
		create eevents.make (30)
		set_events(eevents)
	end

feature
	date: INTEGER
	events: ARRAYED_LIST [ENTRY]

feature
	set_date(a_date: INTEGER)
	do
		date := a_date
	end

	set_events(a_events: ARRAYED_LIST [ENTRY])
	require
		events_exist: a_events /= Void
	do
		events := a_events
	end

	put_entry(e: ENTRY)
	require
		entry_exists: e /= Void
	do
		current.events.put (e)
	end
end
