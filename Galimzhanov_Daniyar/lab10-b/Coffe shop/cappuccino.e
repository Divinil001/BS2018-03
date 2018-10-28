note
	description: "Summary description for {CAPPUCCINO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAPPUCCINO

inherit
	COFFEE
		redefine
			set_price, set_price_public
		end

create
	create_cappuccino

feature	{CAPPUCCINO, APPLICATION}
	create_cappuccino
		do
			title:="Cappuccino"
			description:="A cappuccino is an espresso-based coffee drink"
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
