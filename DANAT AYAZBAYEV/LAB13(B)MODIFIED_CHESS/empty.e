note
	description: "Summary description for {EMPTY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EMPTY

inherit
	PIECE
		redefine
			can_move
		end

create
	init

feature
	can_move (new : COORDINATES) : BOOLEAN
		do
			Result := true
		end

end
