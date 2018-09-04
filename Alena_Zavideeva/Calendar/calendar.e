class
	CALENDAR
create
	make

feature
	make
	local t: TIME
	do
		t := create_time(2018, 09, 02, 15, 15)
	end

feature
	create_entry (date_a: TIME; owner_a: PERSON; subject_a: STRING;
	place_a: STRING):ENTRY
	local a: ENTRY
	do
		create a.make(date_a, owner_a, subject_a, place_a)
		Result := a
	end

	create_time(year_a: INTEGER; month_a: INTEGER; day_a: INTEGER;	hour_a: INTEGER; minute_a: INTEGER): TIME
	local a: TIME
		do
			create a.make(year_a, month_a, day_a, hour_a, minute_a)
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
	in_conflict (e1, e2 : ENTRY): BOOLEAN
		do
			Result := e1.get_place = e2.get_place or e1.get_time.equals(e2.get_time)
		end
end
