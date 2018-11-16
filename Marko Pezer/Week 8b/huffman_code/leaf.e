note
	description: "Summary description for {LEAF}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LEAF

create
	make

feature

	code: STRING
	value: INTEGER
	char: CHARACTER

	make (c: CHARACTER)
	do
		code := ""
		char := c
		value := 1
	end

	get_char: CHARACTER
	do
		Result := char
	end

	get_val: INTEGER
	do
		Result := value
	end

	get_code: STRING
	do
		Result := code
	end

	set_code(i: STRING)
	do
		code := i
	end

	add_value
	do
		value := value + 1
	end

	set_value (i: INTEGER)
	do
		value := i
	end

end
