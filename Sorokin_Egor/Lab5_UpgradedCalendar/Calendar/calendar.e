class
	CALENDAR

create
	make

feature {NONE}

	lst: LINKED_LIST[ENTRY]
	entry1, entry2, entry3: ENTRY
	day1, day2: DAY
	time1, time2, time3: TIME
	person1, person2: PERSON

	make

		do
			create days.make

			day1 := create_day(5)
			time1 := create_time(19, 30)
			person1 := create_person("Egor", 89270876214, "IU Student", "e.sorokin@innopolis.ru")
			entry1 := create_entry(day1, time1, person1, "Birthday party", "4-304")

			time2 := create_time(19, 30)
			person2 := create_person("Alina", 89271243515, "IU Cleaner", "a.ivanova@innopolis.ru")
			entry2 := create_entry(day1, time2, person2, "New Year", "IU Building")

			day2 := create_day(1)
			time3 := create_time(00, 00)
			entry3 := create_entry(day2, time3, person1, "Day of the Knowledge", "Russia")

			Io.put_string (printable_month + "%N")
			lst := in_conflict(day1)
			Io.put_string (lst[1].subject + "%N" + lst[2].subject)

		end

feature
	days: LINKED_LIST[DAY]

	create_entry(d: DAY; t: TIME; o: PERSON; s, p: STRING) : ENTRY
		local
			entry_: ENTRY
		do
			create entry_.init(d, t, o, s, p)
			add_entry(entry_, d)
			Result := entry_
		end

	create_day(d: INTEGER) : DAY
		local
			day_: DAY
		do
			create day_.init(d)
			add_day(day_)
			Result := day_
		end

	add_day(d: DAY)
		do
			days.extend (d)
		end

	add_entry(e: ENTRY; day: DAY)
		do
			day.events.extend (e)
		end

	create_time(hour_, minute_: INTEGER) : TIME
		local
			time_: TIME
		do
			create time_.init(hour_, minute_)
			Result := time_
		end

	create_person(name_: STRING; number: INTEGER_64; job: STRING; mail: STRING) : PERSON
		local
			person_: PERSON
		do
			create person_.init(name_, number, job, mail)
			Result := person_
		end

	edit_subject(e: ENTRY; new_subject: STRING)
		do
			e.set_subject(new_subject)
		end

	edit_place(e: ENTRY; new_place: STRING)
		do
			e.set_place(new_place)
		end

	edit_date(e: ENTRY; new_date: DAY)
		do
			e.set_date(new_date)
		end

	get_owner_name(e: ENTRY) : STRING
		do
			Result := e.get_name
		end

	in_conflict(d: DAY) : LINKED_LIST[ENTRY]
		local
			i, j: INTEGER
			list: LINKED_LIST[ENTRY]
		do
			create list.make

			from
				i := 1
			until
				i > d.events.count
			loop
				from
					j := i + 1
				until
					j > d.events.count
				loop
					if
						d.events[i].get_time.equals (d.events[j].get_time)
					then
						list.extend (d.events[i])
						list.extend (d.events[j])
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := list
		end

	printable_month: STRING
		local
			i, j: INTEGER
			str: STRING
		do
			str := ""
			from
				i := 1
			until
				i > days.count
			loop
				str.append("Day: " + days[i].date.out + "%N")
				from
					j := 1
				until
					j > days[i].events.count
				loop
					str.append ("%T-Description of the event: " + days[i].events[j].subject + "%N")
					if
						days[i].events[j].get_time.minute = 0
					then
						str.append ("%T-Time of the beginnig: " + days[i].events[j].get_time.hour.out + ":00" + "%N")
					else
						str.append ("%T-Time of the beginnig: " + days[i].events[j].get_time.hour.out + ":" + days[i].events[j].get_time.minute.out + "%N")
					end
					str.append ("%T-Place of the event: " + days[i].events[j].place + "%N")
					str.append ("%T-Owner of the event: " + days[i].events[j].owner.name + " (" + days[i].events[j].owner.work_place + "; " + days[i].events[j].owner.phone_number.out + "; " + days[i].events[j].owner.email + ")" + "%N")
					str.append ("%N")
					j := j + 1
				end
				i := i + 1
			end
			Result := str
		end
end
