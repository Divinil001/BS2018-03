class
	TIME

create
	init

feature
	year: INTEGER
	month: INTEGER
	day: INTEGER
	hour: INTEGER
	minute: INTEGER

feature
	init(year_, month_, day_, hour_, minute_: INTEGER)
		do
			year := year_
			month := month_
			day := day_
			hour := hour_
			minute := minute_
		end

	equals(date_: TIME) : BOOLEAN
		do
			Result := (year = date_.year and month = date_.month and day = date_.day and hour = date_.hour and minute = date_.minute)
		end
end
