note
	description: "Summary description for {CAPPUCCINO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAPPUCCINO
inherit
	COFFEE

create
	make

feature

	make(p, p_pub: REAL)
	do
		name := "Cappuccino"
		price := p
		price_public := p_pub
		description := "Best " + name + ": " + price_public.out + "$.%N"
	ensure then
		price < price_public
	end

end
