note
	description: "Class: PROPERTY_SQUARE"

class
	PROPERTY_SQUARE

inherit
	SQUARE

redefine
	player_on_square
end

create
	make

feature

	number: INTEGER
	price: INTEGER
	rent: INTEGER
	owner: PERSON

feature

	make(n: STRING; num: INTEGER; p: INTEGER; r: INTEGER; o: PERSON)
	do
		name := n
		number := num
		price := p * 1000
		rent := r * 1000
		owner := o
	end

	player_on_square (p: PERSON)
	local
		flag: integer
	do
		io.put_string ("You are on square: " + name + " (" + number.out + ")%NPrice: " + price.out + " RUB  Rent: " + rent.out + " RUB %N")
		if p.id /= owner.id then
			if owner.id = 0 then

				io.put_string ("Do you want to buy this property? %NType 1 for YES or 0 for NO: ")
				io.read_integer
				flag := io.last_integer.twin

				if flag = 1 then
					if p.money >= price then
						owner := p
						p.lose_money (price)
						io.put_string ("You have successfully bought property! %N")
					else
						io.put_string ("You have not enough money to buy this property. %N")
					end
				end
			else
				io.put_string ("You should pay " + rent.out + " RUB to " + owner.name + "%N")
				p.lose_money (rent)
				owner.earn_money (rent)
			end
		else
			io.put_string ("You are owner of this property. %N")
		end
		io.put_new_line
	end

end
