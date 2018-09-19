note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO

create
	create_cell

feature

	value:CHARACTER

	number_copies:INTEGER

	create_cell(val:CHARACTER; num:INTEGER)
		do
			value := val
			number_copies := num
		end

	increase_num(n:INTEGER)
		do
			number_copies := number_copies + n
		end

	decrease_num(n:INTEGER)
		do
			if n > number_copies then
				number_copies := 0
			else
				number_copies := number_copies - n
			end
		end

end
