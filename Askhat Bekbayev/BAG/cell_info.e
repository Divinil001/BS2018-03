note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO
feature
	make(a_value: CHARACTER; a_num: INTEGER)
		do
			value:= a_value
			number_of_copies := a_num
		end
feature
	get_value: CHARACTER
		do
			Result:= value
		end
	get_number: INTEGER
		do
			Result:= number_of_copies
		end
	set_number(n: INTEGER)
		do
			number_of_copies := n
		end
feature
	value: CHARACTER
	number_of_copies: INTEGER

end
