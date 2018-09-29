note
	description: "Summary description for {REVERSE_STRING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REVERSE_STRING

create
	make

feature

	make
	do

	end

	iterative_reverse (str: STRING; n: INTEGER): STRING
	local
		i: INTEGER
		ans: STRING
	do
		ans := ""

		from i := n
		until i < 1
		loop
			ans.append_character (str.item (i))
			i := i - 1
		end
		Result := ans
	end

end
