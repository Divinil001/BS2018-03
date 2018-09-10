note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO

feature -- Access

	number_copies: INTEGER_32
			-- Number of copies of value

	value: CHARACTER_8
			-- Value of the cell


feature -- Element change

	set_number_copies (a_number_copies: like number_copies)
			-- Assign `number_copies' with `a_number_copies'.
		do
			number_copies := a_number_copies
		ensure
			number_copies_assigned: number_copies = a_number_copies
		end

	set_value (a_value: like value)
			-- Assign `value' with `a_value'.
		do
			value := a_value
		ensure
			value_assigned: value = a_value
		end

end
