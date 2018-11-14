note
	description: "LeapYear application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			from
				io.put_string ("Enter the year to see whether it is leap or not%N")
			until
				False
			loop
				io.read_integer
				print(is_year_leap(io.last_integer).out + "%N")
			end
		end

	is_year_leap(year: INTEGER): BOOLEAN
	do
		Result := year \\ 400 = 0 or year \\ 100 /= 0 and year \\ 4 = 0
	end
end
