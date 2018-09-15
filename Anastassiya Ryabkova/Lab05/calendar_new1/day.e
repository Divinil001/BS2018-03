note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY

create	make

feature  --Initialization

	date: INTEGER
	events: ARRAYED_LIST[ENTRY]




	make(a__date:INTEGER; a_event: ENTRY)
	do

		create events.make(0)
		set_date(a__date)

		set_event(a_event)


	end

	set_date(a_date:INTEGER)
	do
		date:=a_date
	end


	set_event(a_event:ENTRY)
	do

		events.force (a_event)
	end



end --end of class DAY
