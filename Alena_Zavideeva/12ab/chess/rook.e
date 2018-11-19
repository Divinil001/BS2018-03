class
	ROOK
inherit
	PIECE
	redefine
		can_move, get_name
	end

create make

feature

	can_move(pos: POSITION): BOOLEAN
		do
			Result := (pos.x-position.x).abs = 0 or (pos.y - position.y).abs = 0
		end

	get_name: STRING
		do
			Result := "RO_"

			if color = "black" then
				Result := Result + "B"
			else
				Result := Result + "W"
			end
		end

end
