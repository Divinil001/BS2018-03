class
	MY_STACK [G]

create
	make

feature

	stack_list: ARRAYED_LIST [G]

	make
		do
			create stack_list.make (0)
		end

feature

	push (e: G)
		do
			stack_list.extend (e)
		end

	remove
		require
			not stack_list.is_empty
		do
			stack_list.remove_right
		end

	item: G
		do
			Result := stack_list.i_th (stack_list.count)
		end

	is_empty: BOOLEAN
		do
			Result := stack_list.is_empty
		end

end
