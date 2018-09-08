note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY

create
	create_day

feature
	date:INTEGER
	events:ARRAY[ENTRY]

feature
	create_day(dt:INTEGER; ev:ARRAY[ENTRY])
	do
		set_date(dt)
		set_events(ev)
	end

feature
	set_date(dt:INTEGER)
	do
		date:=dt
	end

	set_events(ev:ARRAY[ENTRY])
	do
		events:=ev
	end

end
