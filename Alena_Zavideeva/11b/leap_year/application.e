class
	APPLICATION

create
	make

feature
	make
			-- Run application.
		do
		end

	is_leap_year(year: INTEGER): BOOLEAN
		do
			Result := year \\ 400 = 0 or (year \\ 4 = 0 and year \\100 /= 0)
		end
end
