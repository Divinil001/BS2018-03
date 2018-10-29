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

	make (n: STRING; pp: REAL; p: REAL; b: BOOLEAN)
	require
		correct_prices: pp > p
	do
		set_name (n)
		set_public_price (pp)
		set_price (p)
		set_available (b)
	end

end