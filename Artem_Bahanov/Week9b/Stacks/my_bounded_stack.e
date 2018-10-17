class
	MY_BOUNDED_STACK[G]
inherit
	MY_STACK[G]
	rename
		make_empty as make_empty0,
		make_with_one_element as make_with_one_element0
	export
		{NONE}
		make_empty0, make_with_one_element0
	redefine
		push
	end

create make_empty, make_with_one_element
feature -- creation procedures
	make_empty(n_capacity: INTEGER)
		-- make empty stack
	require
		n_capacity > 0
	do
		capacity := n_capacity
		create elements.make
	end

	make_with_one_element(n_capacity: INTEGER element: G)
		-- make stack with one element
	require
		n_capacity > 0
	do
		capacity := n_capacity
		create elements.make
		push(element)
	end

feature -- public feaures
	push(element: G)
		-- put new element on the top of the stack
	require else
		not is_full
	do
		elements.extend(element)
		head := head + 1
	ensure then
		head <= capacity
	end

	is_full: BOOLEAN
		-- returns true if stack is full; else returns false
	do
		Result := head >= capacity
	end


feature{MY_BOUNDED_STACK} -- private features
	capacity: INTEGER
end
