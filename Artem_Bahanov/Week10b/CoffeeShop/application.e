class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
	local
		s: SHOP
			-- Run application.
		do
			--| Add your code here
			create s.make
			s.products.extend (create {ESPRESSO}.make(14, 10, 5))
			s.products.extend (create {CAPPUCCINO}.make(19, 9.5, 3))
			s.products.extend (create {CAKE}.make(24.5, 11.3,  19))
			s.print_menu
			print("Profit: " + s.profit.out + "%N")
			s.products[2].set_price (4.02)
			s.products[3].set_price_public (22.97)
			print("New Profit: " + s.profit.out + "%N")
		end

end
