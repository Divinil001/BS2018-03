note
	description: "coffe_shop application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	sys:SYSTEM

	make
			-- Run application.
		do
			--| Add your code here
			create sys.make
			sys.set_price_public(20,30,40)
			sys.profit
			sys.print_menu
		end

end
