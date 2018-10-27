note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PRODUCT


	feature --initialization

		price_public: REAL

		description: STRING
			deferred
			end

	feature {SYSTEM}
		price:REAL
		public_price:REAL

		set_price (a_price: REAL)
		require
			price_not_negative: a_price >= 0
		do
			price := a_price

		ensure
			price_set: price = a_price
		end

		set_public_price (a_price: REAL)
		require
			price_not_negative: a_price >= 0
		do
			public_price := a_price

		ensure
			price_set: public_price = a_price
		end



	invariant
		price_not_negative: price >= 0 and price_public >= 0
		make_profit: price <= price_public
		have_description: description /= Void





end
