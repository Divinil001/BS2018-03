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

feature
	tree : NODE[INTEGER]
	t2 : NODE[INTEGER]
	t3 : NODE[INTEGER]
	t4 : NODE[INTEGER]

feature {NONE}
	make
		do
			create tree.init(1)
			create t2.init(2)
			create t3.init(3)
			create t4.init(4)
			t3.add (0, t4)
			t2.add (1, t3)
			tree.add (1, t2)
			print(tree.height)
		end
end
