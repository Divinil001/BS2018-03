note
	description: "project_coffe_shop application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	cake:CAKE
	cappuccino:CAPPUCCINO
	espresso:ESPRESSO

feature
	print_menu
		do
			create cake.create_cake
			create cappuccino.create_cappuccino
			create espresso.create_espresso
			cake.set_price (20)
			cake.set_price_public (30)
			cappuccino.set_price (40)
			cappuccino.set_price_public (50)
			espresso.set_price (15)
			espresso.set_price_public (20)

			print("COFFE SHOP MENU: %N")
			io.new_line
			print_description (cake)
			io.new_line
			print_description (cappuccino)
			io.new_line
			print_description (espresso)
			io.new_line
		end

	print_description(object:PRODUCT)
		do
			print("Product: " + object.title + "%NDescription: %N" +object.description + "%N"+ "Real price: " + object.real_price.out + "%N" + "Public price: " + object.price.out + "%N" + "Profit: " + object.profit.out)
			io.new_line
		end


feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			print_menu
		end

end
