class
	TIME
	create make
feature
	hour: INTEGER
	minute: INTEGER

	make(hour_a: INTEGER; minute_a: INTEGER)
		do
			hour := hour_a
			minute := minute_a
		end

	equals(other: TIME):BOOLEAN
		do
			Result := (hour = other.hour and minute = other.minute)
		end
	printable_time:STRING
		do
			Result:=hour.out + " : " + minute.out
		end
end
