class
	DAY
create
	make
	feature
		date: INTEGER
		events: ARRAYED_LIST[ENTRY]

	feature
		make(date_n: INTEGER)
		do
			date := date_n
			create events.make(0)
		end

	feature
		add_event(e: ENTRY)
		do
			events.extend (e)
		end
end
