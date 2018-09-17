note
	description: "BAGS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	boofer: BOOFER
	bag, bag1, bag2 : BAG_1
	make
			-- Run application.
		do
			print("%N")
			create boofer
			create bag.make
			create bag1.make
			create bag2.make


			bag.add ('a', 3)
			bag.add ('a',2)
			bag.add('c', 10)


			print(bag.min)
			print("%N")
			print(bag.max)
			print("%N")
  			bag.remove ('c', 5)
			bag1.add('c', 5)
			bag1.add('a', 5)
			print(bag.is_equal_bag (bag1))
			print("%N")
			bag2.add('l', 3)
			print(bag.is_equal_bag (bag2))
			print("%N")
			bag1.remove ('c', 6)
			print(bag1.elements[1])
			print(bag1.min)
			print("%N")
			print(bag1.max)
			print("%N")
			bag2.remove ('l', 10)
			print(bag2.min)
			print("%N")
			print(bag2.max)
			print("%N")
		end

end
