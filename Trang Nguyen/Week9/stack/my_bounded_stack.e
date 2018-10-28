note
	description: "Summary description for {MY_BOUNDED_STACK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_BOUNDED_STACK [G]

inherit
	MY_STACK [G]
		redefine
			push
		end

create
	make_bounded

feature
	make_bounded (c: INTEGER)
		require
			positive: c > 0
		do
			make
			capacity := c
		end

	capacity: INTEGER

	push (e: G)
		-- Push only if have space
		do
			if stack.count < capacity then
				stack.extend (e)
			end
		end

invariant
	positive: capacity > 0

end
