class
	CALENDAR
create
	make
feature
	days: ARRAYED_LIST[DAY]

feature
	make
	do
		create days.make(0)
	end

	add_day(day: DAY)
	do
		days.extend (day)
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
				if current_day.events[i].place ~ current_day.events[j].place or current_day.events[i].date.fine_seconds = current_day.events[i].date.fine_seconds then
					ans.extend (current_day.events[i])
					ans.extend (current_day.events[j])
				end
				j := j + 1
			end
			i := i + 1
		end
		Result := ans
	end

	printable_month: STRING
	local
		ans: STRING
		i, j : INTEGER
	do
		ans := ""
		from
			i := 1
		until
			i > days.count
		loop
			ans.append (" ### DAY " + i.out + " ### %N")
			from
				j := 1
			until
				j > days[i].events.count
			loop
				ans.append (" * ENTRY " + j.out + " * %N")
				ans.append (days[i].events[j].printable + "%N")
				j := j + 1
			end
			i := i + 1
		end
		Result:=ans
	end
end
