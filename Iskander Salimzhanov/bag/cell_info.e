note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO
create
	fill_in
feature {NONE}
	fill_in(a_val: CHARACTER; a_number_copies: INTEGER)
	do
		set_val(a_val)
		set_number_copies(a_number_copies)
	end
feature
	value: CHARACTER
	number_copies: INTEGER
feature
	set_val(a_val: CHARACTER)
	do
		value := a_val
	end
	set_number_copies(a_number_copies: INTEGER)
	do
		number_copies := a_number_copies
	end
end
