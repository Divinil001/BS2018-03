note
	description: "Summary description for {CAKE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAKE

inherit
	PRODUCT
		redefine
			set_price, set_price_public
		end

create
	create_cake


feature{CAKE, APPLICATION}
	create_cake
		do
			title:="Cake"
			description:="A sweat dessert"
		end

	set_price(new_price:REAL)
		do
			real_price:=new_price
		end

	set_price_public(new_price:REAL)
		do
			price:=new_price
		end

end
