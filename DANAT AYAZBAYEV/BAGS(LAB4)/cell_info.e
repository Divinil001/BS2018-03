note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO

create
	init

feature
	value : CHARACTER
	number_copies : INTEGER

feature
	init (ch : CHARACTER; i : INTEGER)
		do
			set_i(i)
			set_ch(ch)
		end
	set_i (i : INTEGER)
		do
			number_copies := i
		end
	set_ch (ch : CHARACTER)
		do
			value := ch
		end
	add_num (i : INTEGER)
		do
			number_copies := number_copies + i
		end
	get_i : INTEGER
		do
			Result := number_copies
		end
	get_ch : CHARACTER
		do
			Result := value
		end
end
