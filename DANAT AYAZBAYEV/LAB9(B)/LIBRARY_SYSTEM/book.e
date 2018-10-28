note
	description: "Summary description for {BOOK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOOK

create
	init

feature
	name : STRING
	best_seller : BOOLEAN   --Is best-seller book
	restrict : BOOLEAN  --Is restricted for children under 13 years old
	price : INTEGER
	available : BOOLEAN  --Is taken by other person or not

feature
	init (new_name : STRING; b1 : BOOLEAN; b2 : BOOLEAN; new_price : INTEGER)
		do
			set_name(new_name)
			set_b1(b1)
			set_b2(b2)
			set_price(new_price)
			set_b3(true)
		end
	set_name (new_name : STRING)
		do
			name := new_name
		end
	set_b1 (b1 : BOOLEAN)
		do
			best_seller := b1
		end
	set_b2 (b2 : BOOLEAN)
		do
			restrict := b2
		end
	set_price (new_price : INTEGER)
		do
			price := new_price
		end
	set_b3 (b3 : BOOLEAN)
		do
			available := b3
		end
	get_name : STRING
		do
			Result := name
		end
	is_best_seller : BOOLEAN
		do
			Result := best_seller
		end
	is_restricted : BOOLEAN
		do
			Result := restrict
		end
	is_available : BOOLEAN
		do
			Result := available
		end
	get_price : INTEGER
		do
			Result := price
		end
end
