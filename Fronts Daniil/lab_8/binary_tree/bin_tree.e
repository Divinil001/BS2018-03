note
	description: "Summary description for {BIN_TREE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class BIN_TREE [G -> attached ANY]

create
	make

feature
	value: G
	left: DETACHABLE BIN_TREE[G]
	right: DETACHABLE BIN_TREE[G]
	height: INTEGER

	make(v: G)
	do
		value := v
		height := 1
	end

	add_right(t: BIN_TREE[G])
	do
		right := t
		if attached right  as r then
			r.set_height (height + 1)
		end
	end

	add_left(t: BIN_TREE[G])
	do
		left := t
		if attached left  as l then
			l.set_height (height + 1)
		end
	end

	set_height(n: INTEGER)
	do
		height := n
		if attached right  as r then
			r.set_height (height + 1)
		end

		if attached left  as l then
			l.set_height (height + 1)
		end
	end


	printable
	do
		print("Height: " + height.out + ", Value: ")
		print(value)
		print("%N")

		if attached left as l then
			l.printable
		end

		if attached right as r then
			r.printable
		end
	end
end
