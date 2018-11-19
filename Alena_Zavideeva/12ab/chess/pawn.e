class
	PAWN
inherit
	PIECE
	redefine
		make, can_move, get_name
	end
create make

feature
	start: POSITION
	make(col: STRING; pos: POSITION)
		do
			Precursor(col, pos)
			start := pos
		end
	can_move(pos: POSITION): BOOLEAN
	local
		max_step_x: INTEGER
		do
			max_step_x := 1
			if pos = start then
				max_step_x := 2
			end

			Result := (pos.y - position.y) = 0 and ((pos.x - position.x).sign = (4 - start.x).sign) and (max_step_x >= pos.x)
		end

	get_name: STRING
		do
			Result := "PA_"
			if color = "black" then
				Result := Result + "B"
			else
				Result := Result + "W"
			end
		end
end
