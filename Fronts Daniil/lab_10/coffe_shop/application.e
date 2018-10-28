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
	best_cake: CAKE
	best_cap: CAPPUCCINO
	best_esp: ESPRESSO
	menu: ARRAY[FOOD]
	make
		do
			create best_cake.make(5,15)
			create best_cap.make(5,10)
			create best_esp.make(3,7)
			create menu.make_empty
			menu.force (best_cake, 1)
			menu.force (best_cap, 2)
			menu.force (best_esp, 3)
			print_menu
			print(best_cake.profit)
			print("%N")
			best_cake.set_price_public (800)
			print_menu
			print(best_cake.profit)
			print("%N")
		end
	print_menu
	local
		i: INTEGER
	do
		from i := 1 until i = menu.upper + 1  loop
			print(menu[i].description + "%N")
			i := i +1
		end
	end
end
