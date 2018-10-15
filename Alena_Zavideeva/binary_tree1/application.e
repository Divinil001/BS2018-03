class
	APPLICATION
create
	make

feature

	tree : BIN_TREE[INTEGER]
	make
		do
			create tree.make(3)
			tree.add_l (create {BIN_TREE[INTEGER]}.make (5))
			tree.add_r (create {BIN_TREE[INTEGER]}.make (2))
			if attached tree.right as r then
				r.add_l (create {BIN_TREE[INTEGER]}.make (8))
			end
			print(tree.height)
		end

end
