deferred class
	PIECE

feature

	coordinates: TUPLE [x: INTEGER; y: INTEGER]

	color: BOOLEAN

	board: ARRAY2 [detachable PIECE]

	make (coord: TUPLE [x: INTEGER; y: INTEGER]; c: BOOLEAN; b: ARRAY2 [detachable PIECE])
		require
			coord.x >= 1 and then coord.x <= 8 and then coord.y >= 1 and then coord.y <= 8
		do
			board := b
			coordinates := coord.twin
			color := c
		end

feature

	get_coord: TUPLE [x: INTEGER; y: INTEGER]
		do
			Result := coordinates
		end

	get_color: BOOLEAN
		do
			Result := color
		end

	can_move (new_pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		require
			get_coord /~ new_pos and then new_pos.x >= 1 and then new_pos.x <= 8 and then new_pos.y >= 1 and then new_pos.y <= 8
		deferred
		end

	move (new_pos: TUPLE [x: INTEGER; y: INTEGER])
		do
			if can_move (new_pos) then
				board [coordinates.x, coordinates.y] := VOID
				board [new_pos.x, new_pos.y] := current
				coordinates := new_pos.twin
				print ("Moved to: [" + coordinates.x.out + ", " + coordinates.y.out + "]%N")
			else
				print ("Invalid movement!%N")
			end
		end

	is_figure (pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		require
			pos.x >= 1 and then pos.x <= 8 and then pos.y >= 1 and then pos.y <= 8
		do
			if attached board [pos.x, pos.y] as f then
				Result := true
			end
		end

end

