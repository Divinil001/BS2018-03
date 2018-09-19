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

	a,b:MY_BAG

--	temp:ARRAYED_LIST[CELL_INFO]
--	c,v:CELL_INFO

	make
			-- Run application.
		do
			create a.make_bag
			create b.make_bag

			a.add ('c', 3)
			b.add ('c', 2)
			a.remove ('c', 1)


			io.put_boolean (a.is_equal_bag (b))
		end

end
