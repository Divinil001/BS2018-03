note
	description: "leap_year application root class"
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

		local

			year: INTEGER

		do

			print("%NYear: ")

			io.read_integer

			year := io.last_integer

			print(year.out + " is leap year? " + is_leap (year).out)

		end



feature



	is_leap (y: INTEGER): BOOLEAN

		do

			if y \\ 400 = 0 or else (y \\ 4 = 0 and then y \\ 100 /= 0) then

				Result := True

			end

		ensure

			leap: Result = (y \\ 400 = 0) or (y \\ 4 = 0 and y \\ 100 /= 0)

		end



end
