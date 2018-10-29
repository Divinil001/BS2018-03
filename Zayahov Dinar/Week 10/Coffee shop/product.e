note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PRODUCT
feature
	number: INTEGER assign set_number
	price_public: REAL assign set_price_public
	price: REAL assign set_price
	
	description: STRING
		deferred
		end

feature
	set(p: REAL; r: REAL)
		do
			price_public:=p
			price:=r
		end

	set_number(n: INTEGER)
		do
			number:=n
		end

	set_price_public(p: REAL)
		do
			price_public:=p
		end

	set_price(p: REAL)
		do
			price:=p
		end

end

