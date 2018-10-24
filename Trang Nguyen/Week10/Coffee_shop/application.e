note
	description: "coffe_shop application root class"
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
			-- Run application.
		do
			--| Add your code here
			create S.make (2, 5, 1)
			print ("Profit if sell all: " + S.profit.out)
			io.new_line
			S.print_menu
			io.new_line
			S.set_price_public (30.0, 27.5, 15.0)
			S.set_price (23.5, 20.0, 9.5)
			print ("Profit if sell all: " + S.profit.out)
			io.new_line
			S.print_menu
		end

	S: SYSTEM

end
