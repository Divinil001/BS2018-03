note
	description: "muliset application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	b1:MULTISET
	b2:MULTISET

	make
			-- Run application.
		do
			create b1.create_multiset
			create b2.create_multiset


			b1.add ('a', 2)
			b1.add ('b', 1)


			b2.add ('a', 1)
			b2.add ('b', 2)



			print("b1:")
			b1.print_multiset
			print("b2:")
			b2.print_multiset
			print(b1.is_equal_bag (b2).out + "%N")

			b1.remove ('a', 1)
			b1.remove ('c', 5)
			b1.add ('b', 1)
			print("b1:")
			b1.print_multiset

			print(b1.is_equal_bag (b2).out+"%N")
		end

end
