note
	description: "Summary description for {PIECE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PIECE

feature
	colour : CHARACTER
	position : COORDINATES
	move (position_ : COORDINATES)
		do
			position := position_
		end
	new_colour (colour_ : CHARACTER)
		do
			colour := colour_
		end
	can_move (new : COORDINATES) : BOOLEAN
		do
			Result := true
			if new.r < 1 or new.r > 8 or new.c < 1 or new.c > 8 then
				Result := false
			end
			if new.r = position.r and new.c = position.c then
				Result := false
			end
		end
	init (colour_ : CHARACTER; position_ : COORDINATES)
		do
			new_colour(colour_)
			move(position_)
		end
end
