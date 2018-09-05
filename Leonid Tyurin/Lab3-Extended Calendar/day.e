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
	events:ARRAYED_LIST[ENTRY]

	create_day(n:INTEGER)
		do
			date := n
			create events.make(1)
		end



end
