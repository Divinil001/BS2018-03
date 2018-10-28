note
	description: "Summary description for {PROPERTY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PROPERTY
inherit
	SQUARE

create
	make

feature
	price: INTEGER
	rent: INTEGER
	owner: PLAYER
	make(new_name: STRING; new_price, new_rent: INTEGER)
	local
		nobody: PLAYER
	do
		create nobody.make ("nobody")
		set_owner(nobody)
		name := new_name
		price := new_price
		rent := new_rent
	end

	info: STRING
	do
		Result := "This is " + name + ". It costs " + price.out + " and have rent " + rent.out + ".%N"
	end

	set_owner(p: PLAYER)
	do
		owner := p
	end


	action(p: PLAYER)
	local
		ans: STRING
	do
		if not (owner.name ~ "nobody") then
			if owner = p then
				print("%NPlayer " + p.name + " had bought this square.%N")
			else
				print("%NThis is " + owner.name + "'s square.%N")
				print("%N" + p.name + " paid to " + owner.name + " " + rent.out + ".%N")
				owner.change_money(rent)
				p.change_money(-rent)
			end
		else
			print("%NWill player " + p.name + " buy this property? y/n%N")
			from
				ans := ""
			until
				ans ~ "y" or ans ~ "n"
			loop
				io.read_line
				ans := io.last_string.string
			end
			if ans ~ "y" then
				if p.money >= price  then
					p.change_money(-price)
					owner := p
					print("%NDone%N")
				else
					print("%NNo enough money.%N")
				end

			end
		end
	end
end
