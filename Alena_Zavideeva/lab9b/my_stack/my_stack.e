class
	MY_STACK [G]
create make

feature

	a : ARRAY[G]

	make
		do
			create a.make_empty
		end

feature -- Operations with Stack

	push (el : G)
		local i : INTEGER
		do
			a.force (el, a.count + 1)
		end

	remove
		require
			not_empty : not is_empty
		do
			a.remove_tail (1)
		end

	is_empty: BOOLEAN
		do
			Result := a.count = 0
		end

	item : G
		do
			Result := a[a.count]
		end

end
