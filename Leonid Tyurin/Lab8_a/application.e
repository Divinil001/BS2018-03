note
	description: "bin_tree application root class"
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
			b1,b2,b3,b4,b5,b6,b7,b8,b9 : BIN_TREE[INTEGER]
		do
			create b1.make (1)
			create b2.make (2)
			create b3.make (3)
			create b4.make (4)
			create b5.make (5)
			create b6.make (6)
			create b7.make (7)
			create b8.make (8)
			create b9.make (9)


--			b5.add (b7)
--			b4.add (b5)
--			b4.add (b6)
--			b2.add (b3)
--			b2.add (b8)
--			b1.add (b4)
--			b1.add (b2)

			b2.add (b3)
			b1.add (b4)
			b1.add (b2)
			b1.add (b5)
			b1.add (b6)
			b1.add (b7)
			b1.add (b8)

			print (b1.height)
			print (b2.height)
			print (b3.height)
			print (b4.height)
			print (b5.height)
			print (b6.height)
			print (b7.height)
			print (b8.height)
			print (b9.height)
		end

end
