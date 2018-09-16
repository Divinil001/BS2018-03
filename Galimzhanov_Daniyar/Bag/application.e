note
	description: "bag_project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	bag1: NEWBAG
	bag2: NEWBAG

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create bag1.create_bag
			bag1.add('a', 1)
			bag1.add('b', 2)
			--bag1.add ('c', 3)
			print(bag1.max)
			--bag1.remove('c', 3)
			print(bag1.max)


			create bag2.create_bag
			bag2.add('a', 1)
			bag2.add ('b', 2)

			print(bag1.is_equal(bag2))
		end

end
