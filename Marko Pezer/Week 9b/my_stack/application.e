note
	description: "my_stack application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	s: MY_STACK

	make
	do
		create s.make

		io.put_string ("Add elements 1, 2, 3, 4 to stack...%N")
		s.push (1)
		s.push (2)
		s.push (3)
		s.push (4)
		s.print_stack
		io.put_new_line

		io.put_string ("Remove last two elements from stack...%N")
		s.remove
		s.remove
		s.print_stack
		io.put_new_line

		io.put_string ("Add element 5 to stack...%N")
		s.push (5)
		s.print_stack
		io.put_new_line

		io.put_string ("Stack is empty: " + s.is_empty.out + "%N")
		io.put_string ("Last element in stack is: " + s.item.out + "%N")

	end

end
