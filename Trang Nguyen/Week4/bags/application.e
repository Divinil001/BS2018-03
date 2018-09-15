note
	description: "bags application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			io.put_string ("%NTest result!%N")
			create bag1
			bag1.make_elements
			create bag2
			bag2.make_elements
			bag1.add ('a', 3)
			bag1.add ('b', 1)
			bag1.print_bag
			bag2.add ('a', 5)
			bag2.add ('b', 1)
			bag2.print_bag

			io.put_character (bag1.max)
			io.new_line
			io.put_character (bag1.min)

			io.new_line
			io.put_boolean (bag1.is_equal_bag (bag2))
			bag1.add ('a', 2)
			io.new_line
			bag1.print_bag
			io.put_boolean (bag1.is_equal_bag (bag2))

			bag1.remove ('a', 6)
			io.new_line
			bag1.print_bag
		end

feature -- Access

	bag1, bag2: NEW_BAG
			-- object bag1, bag2

end
