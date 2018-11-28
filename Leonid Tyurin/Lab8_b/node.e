note
	description: "Summary description for {NODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NODE
create
	make,
	make_leaf
feature
	is_leaf: BOOLEAN
	left, right: detachable NODE
	val: CHARACTER
	freq: INTEGER
	make(new_left, new_right: NODE)
		do
			left := new_left
			right := new_right
			is_leaf := false
			val := '_'
			freq := new_left.freq + new_right.freq
		end
	make_leaf(new_val: CHARACTER; new_freq: INTEGER)
		do
			val := new_val
			is_leaf := true
			freq := new_freq
		end
end
