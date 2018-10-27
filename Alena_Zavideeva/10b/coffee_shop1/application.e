class
	APPLICATION

create
	make

feature
	shop: SHOP_COFFEE
	make
		do
			create shop.make
			shop.add_product(create {CAPPUCCINO}.make(2.44, 3.55))
			shop.add_product (create {CAKE}.make (4.99, 7))
			shop.add_product (create {ESPRESSO}.make (4.9, 5.5))
			shop.print_all_menu
			print("Profitof all products: " + shop.profit.out)
		end

end
