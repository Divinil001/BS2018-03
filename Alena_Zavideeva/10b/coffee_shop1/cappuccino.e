class
	CAPPUCCINO
inherit
	COFFEE
create make
feature
	make( price_, pub_p : DOUBLE)
		require
			price_ < pub_p
		do
			public_price := pub_p
			price := price_
		end
	description: STRING
		do
			Result := "Cappuccino - double espresso and steamed milk foam."
		end
	name: STRING
		do
			Result := "Cappucino"
		end
end
