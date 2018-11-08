note
	description: "Summary description for {QUEEN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUEEN

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
				if position.r = new.r or position.c = new.c then
					Result := true
				end
			end
		end

end
