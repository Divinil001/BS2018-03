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
	bag: MY_BAG
	second_bag : MY_BAG
	min_chr : CHARACTER
	max_chr : CHARACTER
	equals : BOOLEAN
	make
			-- Run application.
		do
			create bag.make
			create second_bag.make
			equals := False
			bag.set_name("first_bag")
			second_bag.set_name("second_bag")
			bag.add ('Q', 5)
			bag.add ('W', 1)
			bag.add ('f', 1337)

			second_bag.add ('Q', 5)
			second_bag.add ('W', 1)
			second_bag.add ('f', 1337)

			bag.printable
			second_bag.printable

			equals := bag.is_equal_bag (second_bag)
			print("EQUALS IS " + equals.out + "%N")

			bag.remove ('f', 2000)
			bag.printable

			equals := bag.is_equal_bag (second_bag)
			print("After editing, EQUALS IS " + equals.out + "%N")

			min_chr := bag.min
			print("MINIMUM: " + min_chr.out + "%N")

			max_chr := bag.max
			print("MAXIMUM: " + max_chr.out + "%N")
		end

end
