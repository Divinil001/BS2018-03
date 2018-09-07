class
	APPLICATION
create
	make

feature
	days:ARRAY[DAY]
feature
	make
	local
		t: TIME
		i : INTEGER
		temp : LINKED_LIST[ENTRY]
		tmp : DAY
		p1, p2, p3 : PERSON
		e1, e2, e3 : ENTRY
		t1, t2, t3 : TIME
	do
		create temp.make
		create tmp.make (-1, temp)
		create days.make_filled(tmp, 1, 30)

		create p1.make ("SASHA",855852852852,"Somewhere", "sas@gmail.com")
		create p2.make ("MISHA",855384572852,"Innopolis", "sas228@gmail.com")
		create p3.make ("VLADI",855384572852,"DELTATION", "jfksdj@gmail.com")

		create t1.make (11, 30)
		create t2.make (12, 30)
		create t3.make (12, 30)

		create e1.make (t1, p1, "Cafe", "Elm Street")
		create e2.make (t2, p2, "Meeting","Lenin Street")
		create e3.make (t3, p3, "Relaxing", "Lenin Street")

		from
			i:=1
		until
			i > days.count
		loop
			create temp.make
			create tmp.make(i, temp)
			days[i] := tmp
			i := i + 1
		end

		add_entry(e1, 1)
		add_entry(e2, 2)
		add_entry(e3, 2)

		print(printable_month)
		temp := in_conflict(2)
		Io.put_string ("Entries in conflict in day 2 :%N")
		from
			i := 1
		until
			i > temp.count
		loop
			Io.put_string (temp[i].printable_entry)
			i := i + 1
		end
	end

feature
	add_entry (e:ENTRY; day:INTEGER)
		do
			days[day].events.extend(e)
		end

	create_time(hour_a: INTEGER; minute_a: INTEGER): TIME
	local a: TIME
		do
			create a.make(hour_a, minute_a)
			Result := a
		end

	edit_subject(e: ENTRY; new_subject: STRING)
		do
			e.set_subject(new_subject)
		end

	edit_date (e: ENTRY; new_date: TIME)
		do
			e.set_date(new_date)
		end
	get_owner_name(e: ENTRY): STRING
		do
			Result := e.get_name;
		end
	in_conflict (day: INTEGER): LINKED_LIST[ENTRY]
		local
			i, j: INTEGER
			events: LINKED_LIST[ENTRY]
		do
			create Result.make
			events := days[day].events
			from
				i := 1
			until
				i > events.count
			loop
				from
					j := 1
				until
					j > events.count
				loop
					if (events[i].get_place = events[j].get_place or events[i].get_time.equals(events[j].get_time)) and i /= j
					then
						Result.extend (events[i])
					end
					j := j + 1
				end
				i := i + 1
			end
		end
	printable_month:STRING
		local
			i: INTEGER
		do
			Result:= ""
			from
				i := 1
			until
				i > days.count
			loop
				Result.append(days[i].printable_day)
				i := i + 1
			end

		end
end
