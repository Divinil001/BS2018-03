note
	description: "Summary description for {HUFFMAN_NODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class HUFFMAN_NODE[T -> COMPARABLE]
inherit
	COMPARABLE
	redefine
		three_way_comparison
	end
create
	leaf_node, inner_node
feature {NONE}
	leaf_node (a_probability: REAL_64; a_value: T)
	do
		probability := a_probability
		value := a_value
		is_leaf := true

		left := void
		right := void
		parent := void
	end

	inner_node (a_left, a_right: HUFFMAN_NODE[T])
	do
		left := a_left
		right := a_right

		a_left.parent := Current
		a_right.parent := Current
		a_left.is_zero := true
		a_right.is_zero := false

		probability := a_left.probability + a_right.probability
		is_leaf := false
	end

feature
	probability: REAL_64
	value: detachable T


	is_leaf: BOOLEAN
	is_zero: BOOLEAN assign set_is_zero

	set_is_zero (a_value: BOOLEAN)
	do
		is_zero := a_value
	end

	left: detachable HUFFMAN_NODE[T]
	right: detachable HUFFMAN_NODE[T]
	parent: detachable HUFFMAN_NODE[T] assign set_parent

	set_parent (a_parent: detachable HUFFMAN_NODE[T])
	do
		parent := a_parent
	end

	is_root: BOOLEAN
	do
		Result := parent = void
	end

	bit_value: INTEGER
	do
		if is_zero then
			Result := 0
		else
			Result := 1
		end
	end
feature -- comparable implementation
	is_less alias "<" (other: like Current): BOOLEAN
	do
		Result := three_way_comparison (other) = -1
	end

	three_way_comparison (other: like Current): INTEGER
	do
		Result := -probability.three_way_comparison (other.probability)
	end
end

