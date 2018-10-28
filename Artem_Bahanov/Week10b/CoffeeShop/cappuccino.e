class
	CAPPUCCINO
inherit
	COFFEE
	redefine
		description
	end
create
	make
feature
	description: STRING
	once
		Result := "A coffee with milk and milk foam"
	end
end
