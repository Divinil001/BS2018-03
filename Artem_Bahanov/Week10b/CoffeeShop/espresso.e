class
	ESPRESSO
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
		Result := "A small strong coffee"
	end
end
