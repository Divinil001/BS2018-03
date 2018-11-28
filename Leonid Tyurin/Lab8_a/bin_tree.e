note
	description: "Summary description for {BIN_TREE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIN_TREE[G]
create
	make
feature
	make(new_info: G)
		do
			info := new_info
			height := 0
		end
	info: G
	left, right: detachable BIN_TREE[G]
	height: INTEGER

	add(t: BIN_TREE[G])
		do
			if left = Void then
				left := t
				if attached right as right1 then
					height := t.height.max (right1.height) + 1
				else
					height := t.height + 1
				end
			elseif right = Void then
				right := t
				if attached left as left1 then
					height := t.height.max (left1.height) + 1
				else
					height := t.height + 1
				end
			else
				if attached left as left1 and attached right as right1 then
					if left1.height <= right1.height then
						left1.add (t)
					else
						right1.add (t)
					end
					height := left1.height.max(right1.height) + 1
				end
			end
		end
end
