note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			year : INTEGER
		do
			print("Enter the year%N")
			io.read_integer
			year := io.last_integer
			if year \\ 400 = 0 or (year \\ 4 = 0 and year \\ 100 /= 0) then
				print("It is a leap year!%N")
			else
				print("It is not a leap year!%N")
			end
		end

end
