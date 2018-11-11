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

	r: G
	lsub: detachable BIN_TREE[G]
	rsub: detachable BIN_TREE[G]

	make(t: G)
	do
		r := t
	end

	height: INTEGER
	local
		hl, hr: INTEGER
	do
		if attached lsub as ls then
			hl := ls.height
		end

		if attached rsub as rs then
			hr := rs.height
		end

		if hl <= hl then
			Result := hr + 1
		else
			Result := hl + 1
		end
	end

	left: detachable BIN_TREE[G]
	do
		Result := lsub
	end

	right: detachable BIN_TREE[G]
	do
		Result := rsub
	end

	add_left (tree: detachable BIN_TREE[G])
	do
		lsub := tree
	end

	add_right (tree: detachable BIN_TREE[G])
	do
		rsub := tree
	end

	root: G
	do
		Result := r
	end

end
