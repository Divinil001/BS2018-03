note
	description: "Summary description for {CAPPUCINO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAPPUCINO

inherit
	COFFEE
create
	set_prices

feature
	description : STRING
		do
			Result := "CAPPUCINO, a coffee with milk and milk foam"
		end
end
