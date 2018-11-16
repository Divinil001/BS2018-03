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

feature {NONE}

	y: YEAR

	make
	do
		create y

		if y.is_leap_year (2012) = True then
			io.put_string ("Year 2012 is leap year!%N")
		else
			io.put_string ("Year 2012 is not leap year!%N")
		end

		if y.is_leap_year (2018) = True then
			io.put_string ("Year 2018 is leap year!%N")
		else
			io.put_string ("Year 2018 is not leap year!%N")
		end

		if y.is_leap_year (1900) = True then
			io.put_string ("Year 1900 is leap year!%N")
		else
			io.put_string ("Year 1900 is not leap year!%N")
		end

		if y.is_leap_year (2000) = True then
			io.put_string ("Year 2000 is leap year!%N")
		else
			io.put_string ("Year 2000 is not leap year!%N")
		end
	end

end
