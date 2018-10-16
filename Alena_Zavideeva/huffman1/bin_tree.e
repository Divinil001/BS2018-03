class
	BIN_TREE [G]
create make

feature

	root : G
	left_subtree : detachable BIN_TREE [G]
	right_subtree : detachable BIN_TREE [G]

	make(root_: G)
	do
		root := root_
	end

	info : G
		do
			Result := root
		end

	left: detachable BIN_TREE[G]
		do
			Result := left_subtree
		end

	right: detachable BIN_TREE[G]
		do
			Result := right_subtree
		end

	height: INTEGER
	local
		k_l : INTEGER
		k_r : INTEGER
		do
			if attached Current.left_subtree as l then
				k_l := l.height
			end

			if attached Current.right_subtree as r then
				k_r := r.height
			end

			if k_l > k_r then
				Result := 1 + k_l
			else
				Result := 1 + k_r
			end

		end
	add_r(t: detachable BIN_TREE[G])
		require
			no_void: t /= Void
		do
			right_subtree := t
		end
	add_l(t: detachable BIN_TREE[G])
		require
			no_void : t /= Void
		do
			left_subtree := t
		end
end
