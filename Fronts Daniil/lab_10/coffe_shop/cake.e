note
	description: "Summary description for {CAKE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAKE
inherit
	FOOD

create
	make

feature
	price: REAL
	price_public: REAL

	set_price(new_price: REAL)
	do
		price := new_price
	ensure then
		price < price_public
	end

	set_price_public(new_price_public: REAL)
	do
		price_public := new_price_public
		description := "Best " + name + ": " + price_public.out + "$.%N"
	ensure
		price_public > price
	end

	profit: REAL
	do
		Result := price_public - price
	end

	make(p, p_pub: REAL)
	do
		name := "Cake"
		price := p
		price_public := p_pub
		description := "Best " + name + ": " + price_public.out + "$.%N"
	ensure then
		price < price_public
	end
end
