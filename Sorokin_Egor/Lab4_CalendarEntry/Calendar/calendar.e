class
	CALENDAR

create
	make

feature {NONE}

	entry1: ENTRY

	make

		do
			entry1 := create_entry(create_date(2018, 09, 01, 9, 00),
			 create_person("Egor", 89270876214, "IU Student", "e.sorokin@innopolis.ru"), "Day of Knowledge", "Everywhere")
			edit_subject(entry1, "Day of the Fool")
		end

feature
	create_entry(d: TIME; o: PERSON; s, p: STRING) : ENTRY
		local
			entry_: ENTRY
		do
			create entry_.init(d, o, s, p)
			Result := entry_
		end

	create_date(year_, month_, day_, hour_, minute_: INTEGER) : TIME
		local
			date_: TIME
		do
			create date_.init(year_, month_, day_, hour_, minute_)
			Result := date_
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

	edit_date(e: ENTRY; new_date: TIME)
		do
			e.set_date(new_date)
		end

	get_owner_name(e: ENTRY) : STRING
		do
			Result := e.get_name()
		end

	in_conflict(e1, e2: ENTRY) : BOOLEAN
		do
			Result := e1.get_date.equals(e2.get_date)
		end
end
