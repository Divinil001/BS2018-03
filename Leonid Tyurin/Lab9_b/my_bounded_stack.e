class
	MY_BOUNDED_STACK[G]

inherit
	MY_STACK [G]
		redefine
			make,
			push
		end

create
	make,
	make_limited

feature
	limit:INTEGER

	make
	do
		create stack_list.make(0)
		limit := stack_list.capacity
	end

	make_limited(bound:INTEGER)
	require
		bound > 0
	do
		create stack_list.make(0)
		limit := bound
	end

	push(e:G)
	do
		if stack_list.count < limit then
			stack_list.extend (e)
		end
	end
end
