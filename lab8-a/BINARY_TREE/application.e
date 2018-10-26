note
	description: "project_binary_tree application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	bin_tree:BIN_TREE[INTEGER]


feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create bin_tree.make_tree(5)
			bin_tree.add (7)
			bin_tree.add (3)
			bin_tree.add (13)
			bin_tree.add (1)
			bin_tree.add (25)
			bin_tree.add (29)
			bin_tree.add (100)
		

			io.new_line
			print("The height of tree: " + bin_tree.height.out)
			io.new_line
			print("Left subtree: " + "%N")
			bin_tree.left --it prints all left subtrees
			io.new_line
			print("Rigth subtree: " + "%N")
			bin_tree.right --it prints all right subtrees
			io.new_line
		end

end
