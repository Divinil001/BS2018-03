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

feature
	create_cell(vl:CHARACTER; num:INTEGER)
	do
		set_value(vl)
		set_number(num)
	end

feature
	set_value(vl:CHARACTER)
	do
		value := vl
	end

	set_number(nmb:INTEGER)
	do
		number_copies := nmb
	end

end
