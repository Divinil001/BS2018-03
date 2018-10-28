class
	ESPRESSO
inherit COFFEE

create make

feature
	make( price_, pub_p  : DOUBLE)
		require
			price_ < pub_p
		do
			public_price := pub_p
			price := price_
		end
	description: STRING
		do
			Result := "Espresso has more caffeine per unit volume than most coffee beverages"
		end
	name: STRING
		do
			Result := "Espresso"
		end
end
