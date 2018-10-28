note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class PRODUCT

feature
	price : INTEGER
	price_public : INTEGER

feature
	set_prices (x : INTEGER; y : INTEGER)
		do
			set_price(x)
			set_price_public(y)
		end
	set_price_public (x : INTEGER)
		do
			price_public := x
		end
	set_price (x : INTEGER)
		do
			price := x
		end
	description : STRING
		deferred
		end
end
