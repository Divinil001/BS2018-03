note
	description: "Summary description for {CALENDAR}."
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

create
	create_new_calendar

feature

	days: ARRAYED_LIST[DAY]

	create_new_calendar
	do
		create days.make(0)
	end

	add_day (new_day: DAY)
	do
		days.extend (new_day)
	end

	-- Entries	

	create_entry (new_person: PERSON; new_date: TIME; new_subject: STRING; new_place: STRING): ENTRY
	local
		entry: ENTRY
	do
		create entry.create_new_entry (new_person, new_date, new_subject, new_place)
		Result := entry
	end

	add_entry (new_entry: ENTRY; new_day: INTEGER)
	do
		days[new_day].events.extend (new_entry)
	end

	edit_subject (my_entry: ENTRY; new_subject: STRING)
	do
		my_entry.set_subject (new_subject)
	end

	edit_date (my_entry: ENTRY; new_date: TIME)
	do
		my_entry.set_date (new_date)
	end

	get_owner_name (my_entry: ENTRY): STRING
	do
		Result := my_entry.owner.name
	end

	output_all: STRING
	local
		answer: STRING
		i, j : INTEGER
	do

		answer := ""

		from i := 1 until i > days.count
		loop

			answer.append ("%N__ DAY " + i.out + " _________________%N%N")

			from j := 1 until j > days[i].events.count
			loop

				answer.append ("   EVENT " + j.out + ":%N")
				answer.append (days[i].events[j].print_entry + "%N")
				j := j + 1

			end
			i := i + 1

		end

		Result := answer

	end
end
