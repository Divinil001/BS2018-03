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

feature {NONE}

	c: CAPPUCCINO
	e: ESPRESSO
	cc, chc: CAKE

	make
	do
		create c.make ("Cappuccino", 8, 4.5, True)
		create e.make ("Espresso", 7.5, 3, True)
		create cc.make ("Caramel cake", 14, 9, True)
		create chc.make ("Chocolate cake", 13, 8.5, True)

		io.put_string ("Menu: %N%N")
		c.print_info
		e.print_info
		cc.print_info
		chc.print_info

		io.put_string ("Change Cappuccino public price to 7.5...%N")
		c.set_public_price (7.5)
		io.put_string ("Caramel cake is not available...%N")
		cc.set_available (False)
		io.put_string ("Change Espresso price to 4...%N")
		e.set_price (4)

		io.put_string ("Menu: %N%N")
		c.print_info
		e.print_info
		cc.print_info
		chc.print_info

	end

end
