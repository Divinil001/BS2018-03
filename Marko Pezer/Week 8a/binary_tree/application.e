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

	binary_tree: BIN_TREE[CHARACTER]

	make
	do
		io.put_string ("Creating steps: %N")
		io.put_string (" 1. Create binary tree with root A %N")
		create binary_tree.make('A')


		io.put_string (" 2. Add left subtree with root element B %N")
		binary_tree.add_left (create {BIN_TREE[CHARACTER]}.make ('B'))
		
		io.put_string (" 3. Add right subtree with root element C %N")
		binary_tree.add_right (create {BIN_TREE[CHARACTER]}.make ('C'))

		io.put_new_line

		-- Print tree info
		io.put_string ("Binary tree root element: " + binary_tree.root.out + "%N")
		io.put_string ("Binary tree height: " + binary_tree.height.out + "%N")
	end

end
