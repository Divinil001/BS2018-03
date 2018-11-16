note
	description: "Summary description for {MY_BINARY_TREE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_BINARY_TREE [G]

create make

feature

	root_value: G
	leftst: detachable MY_BINARY_TREE [G]
	rightst: detachable MY_BINARY_TREE [G]

	make (rv: G)
	do
		root_value := rv
	end

	left: detachable MY_BINARY_TREE[G]
	do
		Result := leftst
	end

	right: detachable MY_BINARY_TREE[G]
	do
		Result := rightst
	end

	add_right (x: detachable MY_BINARY_TREE[G])
	do
		rightst := x
	end

	add_left (x: detachable MY_BINARY_TREE[G])
	do
		leftst := x
	end
end
