deferred class
	PIECE

feature {NONE}

	color: STRING
	position: POSITION

feature
	make(col: STRING; pos: POSITION)
		require
			usual_color: col ~ "black" or col ~ "white"
			pos_right: pos.x <=8 and pos.x >=1 and pos.y<=8 and pos.y >= 1
		do
			create color.make_from_string (col)
			position := pos
		end

	get_color: STRING
		do
			create Result.make_from_string (color)
		end

	get_position: POSITION
		do
			Result := position
		end

	can_move (pos: POSITION): BOOLEAN
		require
			pos_right: pos.x <=8 and pos.x >=1 and pos.y<=8 and pos.y >= 1
		deferred
		end


	move (pos: POSITION)
		require
			can_move (pos)
		do
			position := pos
		end
	get_name: STRING
		deferred
		end

end
