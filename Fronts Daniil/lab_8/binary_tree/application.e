note
	description: "binary_tree application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	root: BIN_TREE[STRING]
	r: BIN_TREE[STRING]
	l: BIN_TREE[STRING]
	rr: BIN_TREE[STRING]
	nt: BIN_TREE[STRING]
	lnt: BIN_TREE[STRING]
	rnt: BIN_TREE[STRING]
	rootint: BIN_TREE[INTEGER]
	rint: BIN_TREE[INTEGER]
	lint: BIN_TREE[INTEGER]
	rrint: BIN_TREE[INTEGER]
	make
		do
			create root.make("root")
			create r.make ("right_subroot")
			create l.make ("left_subroot")
			create rr.make("right_right_subroot")
			create nt.make("new_tree")
			create lnt.make("left_new_tree")
			create rnt.make("right_new_tree")
			root.add_left (l)
			root.add_right (r)
			r.add_right (rr)
			nt.add_right(rnt)
			nt.add_left(lnt)
			rr.add_right (nt)
			root.printable
			print("%NINTEGER_TREE%N")
			create rootint.make(1)
			create rint.make (2)
			create lint.make (3)
			create rrint.make(20)
			rootint.add_left (lint)
			rootint.add_right (rint)
			rint.add_right (rrint)
			rootint.printable
		end

end
