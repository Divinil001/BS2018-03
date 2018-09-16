note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO

create
	create_cell_info

feature
    value:CHARACTER
    number_copies:INTEGER

feature
	create_cell_info(a_value: CHARACTER; a_number_copies: INTEGER)
		do
			value:=a_value
			number_copies:=a_number_copies
		end

	set_number(numb:INTEGER)
		do
			number_copies:=numb
		end

	incr(a_number_copies: INTEGER)
		do
			number_copies:= number_copies + a_number_copies
		end

end
