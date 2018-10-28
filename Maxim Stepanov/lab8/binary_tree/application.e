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

feature {NONE}

	make
		local
			n1, n2, n3, n4: M_BINARY_TREE_NODE[INTEGER]
		do
			create n1.make(1) 
			create n2.make(2)
			create n3.make(3)
			create n4.make(4)

			n1.add(n2)
			n1.add(n3)

			n2.add(n4)

			print(n1.height)
			print("%N")
		end



end
