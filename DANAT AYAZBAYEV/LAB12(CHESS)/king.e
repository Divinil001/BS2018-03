note
	description: "Summary description for {KING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KING

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
				if (new.r - position.r).abs < 2 and (new.c - position.c).abs < 2 then
					Result := true
				end
			end
		end

end
