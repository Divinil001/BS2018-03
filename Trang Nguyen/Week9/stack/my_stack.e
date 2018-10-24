note
	description: "Summary description for {MY_STACK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_STACK [G]

create
	make

feature

	make
		do
			create stack.make(0)
		end

	stack: ARRAYED_LIST [G]
		-- Stack

	push (e: G)
		-- Add an element to the collection
		do
			stack.extend (e)
		end

	remove
		-- Remove the most recently added element
		do
			stack.finish
			stack.remove
		end

	is_empty: BOOLEAN
		-- Wherether stack is empty or not
		do
			Result := stack.is_empty
		end

	item: G
		-- Give access to the top without modify stack
		do
			Result := stack.last
		end

end
