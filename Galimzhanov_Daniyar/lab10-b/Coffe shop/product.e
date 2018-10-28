note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PRODUCT

feature{COFFEE, ESPRESSO, CAPPUCCINO, APPLICATION}
	price:REAL
	real_price:REAL
	description:STRING
	title:STRING

feature{COFFEE, ESPRESSO, CAPPUCCINO, APPLICATION}
	set_price_public(new_price:REAL)
		--set price for clients
		require
			pos_numb:new_price>=0
		do

		end

	set_price(new_price:REAL)
		--set real price
		require
			pos_numb:new_price>=0
		do

		end

	profit:REAL
		do
			Result:=price - real_price
		end
end
