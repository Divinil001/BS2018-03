note
	description: "project_spooky application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	is_it_leap(year:INTEGER)
		do
			if year \\ 400 = 0 or (year \\ 4 = 0 and year \\ 100 /= 0) then
				io.putstring ( year.out + " is a leap year")
				io.new_line
			else
				io.putstring ("It is not leap year")
				io.new_line
			end
		end





feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			is_it_leap (2020)
		end

end
