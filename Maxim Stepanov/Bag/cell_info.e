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
	value: CHARACTER
	number_of_copies: INTEGER

	make(a_value: CHARACTER count: INTEGER)
	do
		value := a_value
		number_of_copies := count
	end

	set_count(count: INTEGER)
	do
		number_of_copies := count
	end

end
