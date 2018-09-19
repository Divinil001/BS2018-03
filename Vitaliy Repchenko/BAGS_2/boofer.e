note
	description: "Summary description for {BOOFER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOOFER
feature
	create_cell(a_value: CHARACTER; a_number_copies: INTEGER_64):CELL_INFO
		local
			qwerty: CELL_INFO
		do
			create qwerty.make(a_value, a_number_copies)
			Result := qwerty
		end
end
