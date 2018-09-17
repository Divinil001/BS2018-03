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
	number_copies: INTEGER_64
feature

	make(a_value: CHARACTER; a_number_copies: INTEGER_64)
		do
			set_value(a_value)
			set_number_copies(a_number_copies)
		end

	set_value(a_value: CHARACTER)
		do
			value := a_value
		end

	set_number_copies(a_number_copies: INTEGER_64)
		do
			number_copies := a_number_copies
		end

end
