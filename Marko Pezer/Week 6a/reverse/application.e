note
	description: "reverse application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	reverse: REVERSE_STRING
	a: STRING

	make
		do
			create reverse.make

			io.put_string ("Input your string: ")
			io.read_line
			a := io.last_string
			io.put_string ("Reversed string: ")
			io.put_string (reverse.iterative_reverse(a, a.count))
			io.put_new_line
		end

end
