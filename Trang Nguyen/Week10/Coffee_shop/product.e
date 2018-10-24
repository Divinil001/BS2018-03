note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PRODUCT

feature -- public

	price_public: REAL

	description: STRING
		deferred
		end

feature {SYSTEM}

	set_price (r: REAL)
		require
			r_not_negative: r >= 0
		do
			price := r
		ensure
			price_set: price = r
		end

	price: REAL

	set_price_public (r: REAL)
		require
			r_not_negative: r >= 0
		do
			price_public := r
		ensure
			price_public_set: price_public = r
		end

invariant
	price_not_negative: price >= 0 and price_public >= 0
	make_profit: price <= price_public
	have_description: description /= Void

end
