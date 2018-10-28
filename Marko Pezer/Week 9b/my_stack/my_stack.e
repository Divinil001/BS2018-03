note
	description: "Summary description for {MY_STACK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_STACK

create
	make

feature

	size: INTEGER
	stack: ARRAY[INTEGER]

feature

	make
	do
		create stack.make_filled (-1, 1, 10000)
	end

	push (n: INTEGER)
	require
		positive_number: n >= 0
	do
		size := size + 1
		stack.put (n, size)
	end

	remove
	do
		stack.put (-1, size)
		size := size - 1
	end

	item: INTEGER
	do
		Result := stack.item (size)
	end

	is_empty: BOOLEAN
	do
		if size = 0 then
			Result := True
		else
			Result := False
		end
	end

	print_stack
	local
		i: INTEGER
	do
		io.put_string ("Stack: ")
		from i := 1
		until i > size
		loop
			io.put_string (stack.item (i).out + " ")
			i := i + 1
		end
		io.put_new_line
	end

end
