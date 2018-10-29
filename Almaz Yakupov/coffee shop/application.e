note
	description: "COFFEE_SHOP application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	cake: CAKE
	espresso: ESPRESSO
	cappuccino: CAPPUCCINO
	shop: SHOP

feature
	make
		do
			create cake.set_prices("Cake",5,10)
			create espresso.set_prices("Espresso",10,20)
			create cappuccino.set_prices("Cappuccino",8,16)
			create shop.build(10)

			shop.put(cake)
			shop.put(espresso)
			shop.put(cappuccino)
			shop.put(espresso)
			shop.put(espresso)

			shop.print_menu
			Io.new_line
			print("profit == ")
			print(shop.profit)
		end

end
