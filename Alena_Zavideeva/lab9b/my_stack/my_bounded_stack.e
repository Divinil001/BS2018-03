class
	MY_BOUNDED_STACK [G]
inherit
	MY_STACK [G]
redefine
	push
end
create make_bounded
feature
	capacity: INTEGER
	make_bounded(capacity_: INTEGER)
		do
			capacity := capacity_
			create a.make_empty
		end

	push(el : G)
		require else
			out_of_boundes: a.count < capacity
		do
			precursor(el)
			--print(a.count.out + " " + capacity.out + "%N")
		ensure then
			 a.count <= capacity
		end
end
