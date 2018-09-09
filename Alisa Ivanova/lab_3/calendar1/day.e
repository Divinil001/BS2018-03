note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY

feature

	date: INTEGER -- an identifier of the day (e.g. day 4th of the month);
	events: LIST [ENTRY] -- a list of the events of that day;


end
