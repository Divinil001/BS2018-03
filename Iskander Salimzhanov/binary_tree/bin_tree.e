note
	description: "Summary description for {BIN_TREE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIN_TREE
create
	make
feature
	make(a_l, a_r: detachable BIN_TREE; a_height: INTEGER; a_root: NODE)
		require
			valid_height: check_height(a_height, a_l, a_r)
			valid_root: check_root(a_root, a_l, a_r)
		do
			set_left(a_l)
			set_right(a_r)
			set_height(a_height)
			set_root(a_root)
			change_roots
			change_height
		end

feature
	left, right: detachable BIN_TREE
	height: INTEGER
	root: NODE

feature
	set_left(a_tree: detachable BIN_TREE)
		do
			if attached a_tree as tree then
				left := tree
			else
				left := Void
			end
		end

	set_right(a_tree: detachable BIN_TREE)
		do
			if attached a_tree as tree then
				right := tree
			else
				right := Void
			end
		end

	set_height(a_height: INTEGER)
		require
			valid_height: a_height >= 1
		do
			height := a_height
		end

	set_root(a_root: NODE)
		require
			valid_root: a_root.is_root
		do
			root := a_root
		end

	change_roots
		do
			if attached left as lleft then
				lleft.root.set_ancestor(root)
			end
			if attached right as rright then
				rright.root.set_ancestor(root)
			end
		end

	check_height(a_h: INTEGER; a_l, a_r: detachable BIN_TREE): BOOLEAN
		do
			if attached a_l as lleft and attached a_r as rright then
				if lleft.height > rright.height then
					Result := a_h = lleft.height + 1
				else
					Result := a_h = rright.height + 1
				end
			elseif attached a_l as lleft then
				Result := a_h = lleft.height + 1
			elseif attached a_r as rright then
				Result := a_h = rright.height + 1
			else
				Result := a_h = 1
			end
		end

	check_root(a_root: NODE; a_l, a_r: detachable BIN_TREE): BOOLEAN
		do
			if attached a_l as lleft and attached a_r as rright then
				Result := lleft.root.ancestor = a_root and rright.root.ancestor = a_root
			elseif attached a_l as lleft then
				Result := lleft.root.ancestor = a_root
			elseif attached a_r as rright then
				Result := rright.root.ancestor = a_root
			else
				Result := true
			end
			Result := Result and a_root.is_root
		end

	change_height
		do
			if attached left as lleft and attached right as rright then
				if lleft.height > rright.height then
					height := lleft.height + 1
				else
					height := rright.height + 1
				end
			elseif attached left as lleft then
				height := lleft.height + 1
			elseif attached right as rright then
				height := rright.height + 1
			else
				height := 1
			end
		end

	add_left(a_t: BIN_TREE)
		do
			set_left(a_t)
			change_height
			change_roots
		end

	add_right(a_t: BIN_TREE)
		do
			set_right(a_t)
			change_height
			change_roots
		end

	info: INTEGER
		do
			Result := root.value
		end

	info_left: INTEGER
		do
			if attached left as lleft then
				Result := lleft.root.value
			else
				Result := -1
			end
		end

	info_right: INTEGER
		do
			if attached right as rright then
				Result := rright.root.value
			else
				Result := -1
			end
		end
end
