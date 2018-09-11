class
	DAY

create
	init

feature
	date: INTEGER
	events: LINKED_LIST[ENTRY]

feature
	init(day: INTEGER)
		do
			date := day
			create events.make
		end

end
