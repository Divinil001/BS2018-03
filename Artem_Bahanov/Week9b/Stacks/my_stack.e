class
	MY_STACK[G]

create make_empty, make_with_one_element

feature	-- creation procedures
	make_empty
		-- creates empty stack
	do
		create elements.make
	end

	make_with_one_element(element: G)
		-- creates stack with given element
	do
		create elements.make
		push(element)
	end

feature -- public features
	push(element: G)
		-- puts new element on the top of stack
	do
		head := head + 1
		elements.extend (element)
	ensure
		head = old head + 1
		elements.count = old  elements.count + 1
		elements.last = element
	end

	remove
		-- removes the top element
	do
		head := head - 1
		elements.finish
		elements.remove
	ensure
		head = old head - 1
		elements.count = old elements.count - 1
	end

	item: G
		-- return head item if exists; else raise an exeption
	require
		not is_empty
	do
		Result := elements.last
	end

	is_empty: BOOLEAN
		-- return true if stack is empty; otherwise false
	do
		Result := head ~ 0
	end

feature{MY_STACK} -- private features
	elements: LINKED_LIST[G] -- I use LINKED_LIST, because time complexity for pushing or deleting last element is O(1)
	head: INTEGER
end
