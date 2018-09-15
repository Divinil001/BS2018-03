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
	make(new_value: CHARACTER; new_number_copies: INTEGER)
	require
		new_number_copies > 0
	do
		value := new_value
		number_copies := new_number_copies
	end

	add(new_number: INTEGER)
	require
		new_number > 0
	do
		number_copies := number_copies + new_number
	end

	remove(rem_number: INTEGER)
	require
		rem_number > 0
	do
		if  rem_number > number_copies then
			number_copies := 0
		else
			number_copies := number_copies - rem_number
		end
	end

	printable
	do
		print("%TCELL_INFO: value= " + value.out + ", Number= " + number_copies.out + "%N")
	end

	is_equals(b: CELL_INFO): BOOLEAN
	do
		if value = b.value and number_copies = b.number_copies then
			Result := True
		else
			Result := False
		end
	end

feature
	value: CHARACTER
	number_copies: INTEGER

end
