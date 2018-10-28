note
	description: "Summary description for {FIELD_CELL_PROPERTY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_CELL_PROPERTY
inherit
	FIELD_CELL

create make

feature
	description: STRING
	price: INTEGER

	make(desc: STRING a_price: INTEGER)
	do
		description := desc
		price := a_price
	end

	step(p: PLAYER)
	do
		print("Do you want to buy ")
		print(description)
		print(" for ")
		print(price)
		print("K? Your current balance is ")
		print(p.balance)
		print("K.%N")

		io.read_line
		io.last_string.to_lower
		if io.last_string ~ "yes" then
			if p.balance >= price then
				p.add_property (create {PROPERTY}.make(description, price))
				p.change_balance (-price)

				print("You successfully bought this thing! You still have ")
				print (p.balance)
				print("K.%N")
			else
				print("You can't buy it, since you do not have enough money.%N")
			end
		else
			print("You declined buying.%N")
		end
	end

end
