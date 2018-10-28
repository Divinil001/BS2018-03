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
	set_prices

feature
	description : STRING
		do
			Result := "ESPRESSO, a small strong coffee"
		end

end
