note
	description: "Summary description for {BISHOP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BISHOP

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
				if (position.r - new.r).abs = (position.c - new.c).abs then
					Result := true
				end
			end
		end

end
