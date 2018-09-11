note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature

	name: STRING

	char: STRING

	make (a_name: STRING a_char: STRING)
		do
			name := a_name
			char := a_char
		end

end
