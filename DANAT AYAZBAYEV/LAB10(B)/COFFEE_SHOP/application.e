note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	a : ARRAYED_LIST[PRODUCT]

feature
	print_menu
		local
			i : INTEGER
		do
			print("Available products are:%N")
			from i := 1 until i > a.count loop
				print(i.out + " - ")
				print(a[i].description)
				print(". Costs " + a[i].price_public.out + " USD%N%N")
				i := i + 1
			end
		end
	profit : INTEGER
		local
			i : INTEGER
			ans : INTEGER
		do
			from i := 1 until i > a.count loop
				ans := ans + a[i].price_public - a[i].price
				i := i + 1
			end
			Result := ans
		end


feature {NONE}
	make
		local
			b : ESPRESSO
			c : CAPPUCINO
			d : CAKE
		do
			create a.make (0)
			create b.set_prices(25, 25)
			create c.set_prices(25, 26)
			create d.set_prices(25, 27)
			a.extend(b)
			a.extend(c)
			a.extend(d)
			print_menu
			print(profit)
		end

end
