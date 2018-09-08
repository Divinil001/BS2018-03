class
	TIME

create
	init

feature
	hour: INTEGER
	minute: INTEGER

feature
	init(hour_, minute_: INTEGER)
		do
			hour := hour_
			minute := minute_
		end

	equals(time_: TIME) : BOOLEAN
		do
			Result := (hour = time_.hour and minute = time_.minute)
		end
end
