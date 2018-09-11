note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

create
	make


feature
	days :  ARRAY[DAY]
	index_days: INTEGER

feature

	printable_month
	local
		i : INTEGER
		j : INTEGER
		day_events : ARRAY[ENTRY]
	do
		from
			i := 1
		until
			i = days.upper + 1
		loop
			create day_events.make_empty
			day_events := days[i].events
			print("Day " + i.out + ":")
			from
				j := 1
			until
				j = day_events.upper + 1
			loop
				print("%TDATE:" + day_events[j].date.out + "%N")
				print("%TOWNER:" + day_events[j].owner.name + "%N")
				print("%TPLACE:" + day_events[j].place + "%N")
				print("%TSUBJECT:" + day_events[j].subject + "%N")
				print("%N")
				j := j + 1
			end
			i := i + 1
		end

	end

	add_entry(e:ENTRY; day: INTEGER)
	do
		days[day].add_entry(e)
	end

	edit_subject(e: ENTRY; new_subject: STRING)
	do
		e.set_subject (new_subject)
	end

	edit_date(e:ENTRY; new_date: TIME)
	do
		e.set_date (new_date)
	end

	get_owner_name(e: ENTRY): STRING
	do
		Result := e.owner.name
	end

	add_day(new_day: DAY)
	do
		days.force (new_day, index_days)
		index_days := index_days + 1
	end


	in_conflict(day: INTEGER): ARRAY[ENTRY]
	local
		res : ARRAY[ENTRY]
		i: INTEGER
		j : INTEGER
		ind_res: INTEGER
		day_events: ARRAY[ENTRY]
	do
		create res.make_empty
		create day_events.make_empty
		day_events := days[day].events
		ind_res := 1
		from
			i:= 1
		until
			i = day_events.upper
		loop
			from
				j := i + 1
			until
				j = day_events.upper + 1
			loop
				if  day_events[i].place ~ day_events[j].place or day_events[i].date ~ day_events[j].date then
					res.force (day_events[i], ind_res)
					ind_res := ind_res + 1
					res.force (day_events[j], ind_res)
					ind_res := ind_res + 1
				end
				j := j + 1
			end
			i := i + 1
		end
		Result := res
	end

feature -- Initialization
	p1 :PERSON
	d1 :DAY
	d2 :DAY
	e1 :ENTRY
	e2: ENTRY
	t1: TIME
	test: ARRAY[ENTRY]
	make
			-- Run application.
		do
			create days.make_empty
			index_days := 1
			create p1.make
			create d1.make
			create e1.make
			create e2.make
			create t1.make_now
			create d2.make
			p1.edit_contact ("VOVAN", 1488, "INNOPOLICE", "IAMNOTA@mail.com")
			e1.edit_entry (t1, p1, "HZCHTO", "HZGDE")
			e2.edit_entry (t1, p1, "HZCHTO1221", "HZGDE")
			d1.add_entry (e1)
			d2.add_entry (e2)
			d1.add_entry (e2)
			add_day(d1)
			add_day(d2)
			test := in_conflict(1)
			printable_month
		end

end
