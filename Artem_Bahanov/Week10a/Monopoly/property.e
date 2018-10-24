class
	PROPERTY
inherit
	GAME_CELL
create
	make
feature
	name: STRING
	price: INTEGER
	rent: INTEGER

feature
	make(name_n: STRING price_n: INTEGER rent_n: INTEGER)
	do
		make_random
		name := name_n
		price := price_n
		rent := rent_n
	end

	pay(p: PLAYER)
	do
		print(p.name + ", you are on '" + name + "'.%NPrice: " + price.out + "%NRent: " + rent.out + "%N")
		if not attached owner as o and p.money >= price then
			if y_o_n("Do you want to buy it?") then
				p.add_money (- price)
				p.properties.extend(Current)
				owner := p
			else
				print("You do nothing.%N")
			end
		elseif not attached owner as o then
			print("You do nothing, because you do not have enough money to buy this.%N")
		elseif attached owner as o0 then
			if o0 = p then
				print("You are on your own property. Just do nothing..%N")
			else
				o0.add_money (rent)
				p.add_money (- rent)
				print("You pay a rent to " + o0.name + "%N")
			end

		end
	end

end
