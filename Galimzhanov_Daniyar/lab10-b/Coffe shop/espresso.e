note
	description: "Summary description for {ESPRESSO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ESPRESSO

inherit
	COFFEE
		redefine
			set_price, set_price_public
		end

create
	create_espresso

feature{ESPRESSO, APPLICATION}
	create_espresso
		do
			title:="Espresso"
			description:="Espresso - coffee brewed by forcing hot water through darkly roasted coffee beans."
		end

	set_price_public(new:REAL)
		do
			price:=new
		end

	set_price(new:REAL)
		do
			real_price:=new
		end




end
