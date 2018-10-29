note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class PRODUCT

feature
	price_public: REAL
	price: REAL
	name: STRING

feature
	set_prices(n: STRING; r1: REAL; r2: REAL)
		require
			r1_non_negative: r1 >= 0
			r2_non_negative: r2 >= 0
			r2_bigger_than_r1: r2 >= r1
		do
			price := r1
			price_public := r2
			name := n
		end

--	set_price(r: REAL)
--		require
--			r_non_negative: r >= 0
--		do
--			price := r
--		end

--	set_price_public(r: REAL)
--		require
--			r_non_negative: r >= 0
--		do
--			price_public := r
--		end

end
