class
	BISHOP
inherit
	PIECE
	redefine
		can_move, get_name
	end

create make

feature

	can_move(pos: POSITION): BOOLEAN
		do
			Result := (pos.x - position.x).abs = (pos.y - position.y).abs

		end
	get_name: STRING
		do
			Result := "BI_"
			if color = "black" then
				Result := Result + "B"
			else
				Result := Result + "W"
			end
		end
end
