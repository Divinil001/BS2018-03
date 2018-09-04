class
	TIME
	create make
feature
	year: INTEGER
	month: INTEGER
	day: INTEGER
	hour: INTEGER
	minute: INTEGER

	make(year_a: INTEGER; month_a: INTEGER; day_a: INTEGER;	hour_a: INTEGER; minute_a: INTEGER)
	do
		year := year_a
		month := month_a
		day := day_a
		hour := hour_a
		minute := minute_a
	end

	equals(other: TIME):BOOLEAN
	do
		Result := (year = other.year and month = other.month and day = other.day and hour = other.hour and minute = other.minute)
	end
end
