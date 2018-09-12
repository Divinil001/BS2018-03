note
	description: "Summary description for {CALENDAR1}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR1

	create make

	feature --All funclitions of system

	days: ARRAYED_LIST[DAY]

	make
	do
		create days.make(0)
	end

	set_days(a_day:DAY)
	do
		days.force (a_day)
	end


	create_entry(person: PERSON; date: TIME; subject: STRING; place: STRING): ENTRY
	local
		entry: ENTRY
	do
		create entry.make(person, date, subject, place)
		Result := entry
	end

	add_entry(e: ENTRY; day: INTEGER)
	do
		days[day].events.extend(e)
	end

	edit_subject(e: ENTRY; new_subject: STRING)
	do
		e.set_subject(new_subject)
	end

	edit_date(e: ENTRY; new_date: TIME)
	do
		e.set_date(new_date)
	end

	get_owner_name(e: ENTRY): STRING
	do
		Result := e.owner.name
	end

	in_conflict(day: INTEGER): ARRAYED_LIST[ENTRY]
	local
		ans: ARRAYED_LIST[ENTRY]
		current_day: DAY
		i, j: INTEGER
	do
		create ans.make (0)
		current_day := days[day]
		from
			i := 1
		until
			i > current_day.events.count
		loop
			from
				j := i
			until
				j > current_day.events.count
			loop
				if current_day.events[i].place ~ current_day.events[j].place or current_day.events[i].date = current_day.events[i].date then
					ans.extend (current_day.events[i])
					ans.extend (current_day.events[j])
				end
				j := j + 1
			end
			i := i + 1
		end
		Result := ans
	end



end --End of Calendar




