class
	DAY
create
	make
feature
	make(i: INTEGER)
		do
			date := i
			create events.make (0)
		end
feature
	date: INTEGER
	events: ARRAYED_LIST[ENTRY]

	set_date(a_date: INTEGER)
		do
			date := a_date
		end
end
