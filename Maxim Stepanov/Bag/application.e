note
	description: "Bag application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature {NONE}

	make
		local
			bag1, bag2: M_BAG
		do
			create bag1.make
			create bag2.make
			bag1.add ('a', 2)
			bag1.add ('b', 1)

				-- This will throw exception
				-- bag1.remove ('c', 1)

			io.put_boolean (bag1.is_equal_bag (bag2))
			print ("%N")
			bag2.add ('a', 2)
			bag2.add ('b', 1)
			io.put_boolean (bag1.is_equal_bag (bag2))
			print ("%N")
		end

end
