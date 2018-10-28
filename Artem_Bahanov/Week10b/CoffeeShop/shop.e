class
	SHOP
create
	make
feature
	products: ARRAYED_LIST[PRODUCT]

	make
	do
		create products.make(0)
	end

	profit: REAL
	local
		i: INTEGER
	do
		from
			i := 1
		until
			i > products.count
		loop
			Result := Result + products[i].profit
			i := i + 1
		end
	end

	print_menu
	local
		i: INTEGER
	do
		print("*** WELCOME TO OUR SHOP ***%N___________________________%N")
		from
			i := 1
		until
			i > products.count
		loop
			print(i.out + ". " + get_name(products[i]) + "%NPrice: " + products[i].price.out + "%N%N")
			i := i + 1
		end
	end

feature{NONE}
	get_name(p: PRODUCT): STRING
	do
		Result := "sos"
		if attached {CAPPUCCINO} p as p1 then
			Result := "Cappucion"
		elseif attached {ESPRESSO} p as p2 then
			Result := "Espresso"
		elseif attached {CAKE} p as p3 then
			Result := "Cake"
		else
			Result := "Unknown"
		end
	end


end
