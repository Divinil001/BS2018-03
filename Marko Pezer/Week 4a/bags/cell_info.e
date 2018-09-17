note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO

create
	make

feature
	value: CHARACTER assign set_value
	number_copies: INTEGER

feature

	make (new_value: CHARACTER)
	do
		set_value(new_value)
		number_copies := 0
	ensure
		Number_equal_to_zero: number_copies = 0
	end

	set_value (new_value: CHARACTER)
	do
		value := new_value
	end

	add_number_copies (new_number: INTEGER)
	do
		number_copies := number_copies + new_number
	ensure
		Number_of_copies: number_copies >= 0
	end

	max(x1, x2: INTEGER): INTEGER
	do
		if x1 < x2 then
			Result := x2
		else
			Result := x1
		end
	end

end
