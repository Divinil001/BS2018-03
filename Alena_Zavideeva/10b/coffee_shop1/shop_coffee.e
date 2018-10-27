class
	SHOP_COFFEE
create make

feature
	products: ARRAY[PRODUCT]

	make
		do
			create products.make_empty
		end

	add_product(p: PRODUCT)
		do
			products.force (p, products.count + 1)
		end

	remove_product(p: PRODUCT)
		local
			new_products: ARRAY[PRODUCT]
			i : INTEGER
		do
			create new_products.make_empty
			from
				i := 1
			until
				i > products.count
			loop
				if
					p /= products[i]
				then
					new_products.force (products[i],new_products.count + 1)
				end
				i := i + 1
			end
			products := new_products
		end
	profit: DOUBLE
		local
			i : INTEGER
		do
			Result := 0
			from
				i := 1
			until
				i > products.count
			loop
				Result :=Result + products[i].public_price - products[i].price
				i := i + 1
			end
		end

	print_all_menu
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > products.count
			loop
				Io.put_string (products[i].name + ": " +  products[i].out)
				i := i + 1
			end
		end
end
