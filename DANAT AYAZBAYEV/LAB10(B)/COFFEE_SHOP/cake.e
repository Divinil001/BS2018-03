note
	description: "Summary description for {CAKE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAKE

inherit
	PRODUCT

create
	set_prices

feature
	description : STRING
		do
			Result := "CAKE, a sweet dessert"
		end

end
