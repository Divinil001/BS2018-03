note
	description: "bag2 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	bag1:BAG1

	make
			-- Run application.
		do
			--| Add your code here
			create bag1.make
			bag1.add ('a', 2)
			bag1.add ('b', 3)
			bag1.add ('c',4)

			bag1.remove ('c', 2)

			print(bag1.max)
			print(bag1.min)
			
		end

end
