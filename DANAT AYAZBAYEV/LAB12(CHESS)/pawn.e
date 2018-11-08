note
	description: "Summary description for {PAWN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAWN

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
				if colour = 'P' then
					if position.r = 2 and new.r = 4 and new.c = position.c then
						Result := true
					end
					if new.r - position.r = 1 and new.c = position.c then
						Result := true
					end
					if new.r - position.r = 1 and (new.c - position.c).abs = 1 then
						Result := true
					end
				else
					if position.r = 7 and new.r = 5 and new.c = position.c then
						Result := true
					end
					if new.r - position.r = -1 and new.c = position.c then
						Result := true
					end
					if new.r - position.r = -1 and (new.c - position.c).abs = 1 then
						Result := true
					end
				end
			end
		end

end
