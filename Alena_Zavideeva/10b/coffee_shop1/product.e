deferred class
	PRODUCT
inherit
	ANY
redefine
	out
	end
feature
	price, public_price: DOUBLE

	description: STRING
		deferred
		end

	set_price(money: DOUBLE)
		do
			price := money
		end

	set_public_price(money: DOUBLE)
		do
			public_price := money
		end

	out: STRING
		do
			Result := description + "%N" + "Price: " + public_price.out + "%N"
		end
	name: STRING
		deferred
		end
	invariant
		price < public_price
end
