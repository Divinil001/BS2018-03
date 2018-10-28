class
	CAKE
inherit
	product
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
			Result := "Cake is a lie"
		end
	name: STRING
		do
			Result := "Cake"
		end
end
