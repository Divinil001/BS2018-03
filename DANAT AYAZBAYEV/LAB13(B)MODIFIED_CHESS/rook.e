note
	description: "Summary description for {ROOK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ROOK

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
			Result := precursor(new)
			if Result = true then
				Result := false
				if position.r = new.r or position.c = new.c then
					Result := true
				end
			end
		end

end
