note
	description: "Summary description for {SHOP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SHOP

create
	build

feature
	products: ARRAY [PRODUCT]
	empty: CAKE
	n: INTEGER

feature
	build(capacity: INTEGER)
		require
			bigger_than_zero: capacity > 0
		do
			n := 0
			create empty.set_prices("",0,0)
			create products.make_filled(empty, 1, capacity)
		end

feature
	put(input: PRODUCT)
		do
			n := n + 1
			products.put(input, n)
		end

feature
	profit: REAL
		local
			output: REAL
			i: INTEGER
		do
			from
				i := 1
			until
				i > products.capacity
			loop
				output := output + products.at(i).price_public - products.at(i).price
				i := i + 1
			end
			Result := output
		end

feature
	print_menu
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > products.capacity
			loop
				if products.at(i).name.is_equal("") /= True
				then
					Io.new_line
					print(products.at(i).name)
					print("   ")
					print(products.at(i).price_public)
				end
				i := i + 1
			end
		end

end
