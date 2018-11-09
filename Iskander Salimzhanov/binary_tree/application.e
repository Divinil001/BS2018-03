note
	description: "binary_tree application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			a, b, c: BIN_TREE
			node1, node2, node3: NODE
			-- Run application.
		do
			create node1.make (5, Void)
			create node2.make (4, Void)
			create node3.make (3, Void)

			create c.make (Void, Void, 1, node3)
			create b.make (Void, Void, 1, node2)
			create a.make (Void, Void, 1, node1)

			a.add_left (b)
			a.add_right (c)

			print("Root is ")
			print(a.info)
			print("%N")

			print("Value of root of left side is ")
			print(a.info_left)
			print("%N")
			print("Value of root of right side is ")
			print(a.info_right)
			print("%N")

			if attached a.left as lleft then
				print("value of ancestor of root of left side is ")
				if attached lleft.root.ancestor as aancestor then
					print(aancestor.value)
				else
					print("Oops")
				end
				print("%N")
			else
				print("Oops")
			end

			if attached a.right as rright then
				print("value of ancestor of root of right side is ")
				if attached rright.root.ancestor as aancestor then
					print(aancestor.value)
				else
					print("Oops")
				end
				print("%N")
			else
				print("Oops")
			end

			print("Height is ")
			print(a.height)
		end

end
