note
	description: "coffee_shop application root class"
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
			create cap.set (100, 70)
			cap.number:=10
			create esp.set (120, 90)
			esp.number:=10
			create cake.set (60, 40)
			cake.number:=10

			print("Our profit ")
			print(profit)
			print(" rubles")
			io.new_line
			print_menu
		end

feature
	profit: REAL
		local
			n1: REAL
			n2: REAL
		do
			n1:=cap.number*cap.price_public+esp.number*esp.price_public+cake.number*cake.price_public
			n2:=cap.number*cap.price+esp.number*esp.price+cake.number*cake.price
			Result:=n1-n2
		end

	print_menu
		do
			print("Our menu:")
			io.new_line
			print("Espresso ")
			print(esp.price_public)
			print(" rubles.")
			print(" Espresso is: ")
			print(esp.description)
			io.new_line

			print("Cappuccino ")
			print(cap.price_public)
			print(" rubles.")
			print(" Cappuccino is: ")
			print(cap.description)
			io.new_line

			print("Cake ")
			print(cake.price_public)
			print(" rubles.")
			print(" Cake is: ")
			print(cake.description)
			io.new_line
		end

feature
	cap: CAPPUCCINO
	esp: ESPRESSO
	cake: CAKE

end
