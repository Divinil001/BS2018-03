note
	description: "Summary description for {ESPRESSO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ESPRESSO
inherit
	COFFEE

create
	make

feature

	make(p, p_pub: REAL)
	do
		name := "Espresso"
		price := p
		price_public := p_pub
		description := "Best " + name + ": " + price_public.out + "$.%N"
	ensure then
		price < price_public
	end

end
