class
	KNIGHT
inherit
	PIECE
	redefine
		can_move, get_name
	end

create make

feature
	can_move(pos: POSITION): BOOLEAN
		do
			Result := ((pos.x-position.x).abs = 2 and (pos.y - position.y).abs = 1)
			Result := Result or ((pos.x-position.x).abs = 1 and (pos.y - position.y).abs = 2)

		end

	get_name: STRING
		do
			Result := "KN_"
			if color = "black" then
				Result := Result + "B"
			else
				Result := Result + "W"
			end
		end
end
