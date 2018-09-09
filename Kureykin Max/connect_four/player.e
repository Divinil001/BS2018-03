note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	create_player

feature
	ID:INTEGER

	create_player(ident:INTEGER)
	do
		set_id(ident)
	end

	set_id(ident:INTEGER)
	do
		ID:=ident
	end
end
