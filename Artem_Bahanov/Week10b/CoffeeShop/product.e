deferred class
	PRODUCT

feature -- public fields
	price_public: REAL assign set_price_public
	price: REAL assign set_price
 	description: STRING
 	deferred
 	end
	amount: NATURAL

	profit: REAL
		-- the profit of selling the product
	do
		Result := (price_public - price) * amount
	end

	make(price_public_n, price_n: REAL amount_n: NATURAL)
	do
		price_public := price_public_n
		price := price_n
		amount := amount_n
	end
feature -- setters
	set_price_public(price_public_n: REAL)
	require
		price_public_n > 0
	do
		price_public := price_public_n
	end

	set_price(price_n: REAL)
	require
		price_n > 0
	do
		price := price_n
	end

invariant
	price < price_public
end
