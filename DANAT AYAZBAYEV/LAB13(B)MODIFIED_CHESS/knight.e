note
	description: "Summary description for {KNIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KNIGHT

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
				if (position.r - new.r).abs = 2 and (position.c - new.c).abs = 1 then
					Result := true
				end
				if (position.r - new.r).abs = 1 and (position.c - new.c).abs = 2 then
					Result := true
				end
			end
		end

end
