class
	KING
inherit
	PIECE
	redefine
		get_name
	end

create make

feature

	can_move(pos: POSITION): BOOLEAN
		do
			Result := (pos.x - position.x).abs <=1 and (pos.y - position.y).abs <= 1

		end
	get_name: STRING
		do
			Result := "KI_"
			if color = "black" then
				Result := Result + "B"
			else
				Result := Result + "W"
			end
		end
end
