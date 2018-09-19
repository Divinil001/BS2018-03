note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO

create make

feature --Initialize
	value: CHARACTER assign set_value
	number_copies: INTEGER assign set_number

	make(a_value:CHARACTER; a_number:INTEGER)
	do
		set_value(a_value)
		set_number(a_number)
	end

feature --setters

	set_value(a_value:CHARACTER)
	do
		value := a_value

	end

	set_number(a_number:INTEGER)
	do
		number_copies := a_number
	end

end

