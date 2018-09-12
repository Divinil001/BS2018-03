note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

feature
	days: LIST [DAY]

	add_entry(e: ENTRY; day: INTEGER)
		local
			l_day: DAY
		do
			
			days.at(day) :=
		end
	edit_subject(e: ENTRY; new_subject: STRING)
		do

		end
	edit_date(e: ENTRY; new_date: TIME)
		do

		end
	get_owner_name(e: ENTRY): STRING
		do

		end
	in_conflict(day: INTEGER): LIST [ENTRY]
		do

		end
	printable_month: STRING
		do

		end

end
