class
	APPLICATION

create
	make
feature
	make
		do
			-------------------------------------------------
			-------------------------------------------------
			create d1.make(0,0,0)
			create d2.make(1,0,0)
			create d3.make(1,0,0)
			-------------------------------------------------
			create p1.make("Person1", 17, "Work1", "Email_1")
			create p2.make("Person2", 27, "Work2", "Email_2")
			-------------------------------------------------
			create e1.make(d1, p1, "Entry1", "Place1")
			create e2.make(d2, p1, "Entry2", "Place2")
			create e3.make(d3, p2, "Entry3", "Place3")
			-------------------------------------------------
			create day1.make(1)
			create day2.make(2)
			-------------------------------------------------
			create cal.make
			-------------------------------------------------
			-------------------------------------------------
			cal.add_day (day1)
			cal.add_day (day2)
			-------------------------------------------------
			cal.add_entry (e1, 1)
			cal.add_entry (e2, 1)
			cal.add_entry (e3, 1)
			-------------------------------------------------
			cal.add_entry (e1, 2)
			cal.add_entry (e2, 2)
			-------------------------------------------------
			in_conflict_result := cal.in_conflict (1)
			-------------------------------------------------
			print(cal.printable_month)

		end
feature
	e1, e2, e3: ENTRY
	d1, d2, d3: TIME
	p1, p2: PERSON
	cal: CALENDAR
	day1, day2: DAY
	in_conflict_result: ARRAYED_LIST[ENTRY]

end
