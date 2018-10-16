note
	description: "Summary description for {NODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Unnamed", "protocol=URI", "src=http://www.yourwebsite.com"

class
	NODE[G] --Actually binary tree is representable by a node from which we can pass to other nodes

create
	init

feature
	val : G
	tree_height : INTEGER
	par : detachable NODE[G]
	left_c : detachable NODE[G]
	right_c : detachable NODE[G]

feature
	init (new_val : G)
		do
			val := new_val
			tree_height := 0
		end
	info : G
		do
			Result := val
		end
	left : detachable NODE[G]
		do
			Result := left_c
		end
	right : detachable NODE[G]
		do
			Result := right_c
		end
	set_par (new_par : NODE[G])
		do
			par := new_par
		end
	height : INTEGER
		do
			Result := tree_height
		end
	upd_height (new_height : INTEGER)
		do
			tree_height := new_height
		end
	add (where : INTEGER; t : NODE[G]) -- if value of where is 1 then put we t as a left subtree, otherwise we put it as a right subtree
		require
			left_or_right : where = 1 or where = 0
			already_exists : (where = 1 and left_c = void) or (where = 0 and right_c = void)
		local
			cur : NODE[G]
			passed_nodes : INTEGER
		do
			passed_nodes := 0
			cur := current
			from until cur = void loop
				passed_nodes := passed_nodes + 1
				cur.upd_height(cur.height.max(passed_nodes + t.height))
				passed_nodes := cur.height
				cur := cur.par
			end
			if where = 1 then
				left_c := t
			else
				right_c := t
			end
			t.set_par(current)
		end
end
