class
	CALENDAR
create
	make
feature
	make
		do
			create days.make(0)
		end
feature
	days: ARRAYED_LIST[DAY]
feature
	add_day(a_day: DAY)
		do
			days.extend (a_day)
		end
feature
	add_entry(an_entry: ENTRY; a_day: INTEGER)
		do
			days[a_day].events.extend (an_entry)
		end

	edit_subject(an_entry: ENTRY; a_subject: STRING)
		do
			an_entry.set_subject (a_subject)
		end

	get_owner_name(an_entry: ENTRY): STRING
		do
			Result := an_entry.owner.name
		end
	in_conflict(day: INTEGER): ARRAYED_LIST[ENTRY]
		local
			res: ARRAYED_LIST[ENTRY]
			i, j: INTEGER
			current_day: DAY
		do
			create res.make (0)
			current_day := days[day]
			from
				i := 1
			until
				i > current_day.events.count
			loop

				from
					j := i + 1
				until
					j > current_day.events.count
				loop

					if (current_day.events[i].place.out = current_day.events[j].place.out or current_day.events[i].date.fine_seconds = current_day.events[j].date.fine_seconds) then
						res.force (current_day.events[i])
						res.force (current_day.events[j])
					end
					j := j + 1
				end
				i := i + 1
			end

			Result := res
		end
	printable_month: STRING
		local
			i, j: INTEGER
			answer: STRING
		do
			answer := ""
			from i := 1
			until i > days.count
			loop
				answer.append ("%N    ~~~ Day " + i.out + " ~~~%N")
				from j := 1
				until j > days[i].events.count
				loop
					answer.append ("--===> ENTRY #" + j.out + " <===--%N")
					answer.append ("==> Date: " + days[i].events[j].date.out + "%N")
					answer.append ("==> Owner: %N" + days[i].events[j].owner.printable_person + "%N")
					answer.append ("==> Subject: " + days[i].events[j].subject + "%N")
					answer.append ("==> Place: " + days[i].events[j].place + "%N")
					answer.append ("%N")
					j := j + 1
				end
				answer.append ("%N%N")
				i := i + 1
			end
			Result := answer
		end
end
