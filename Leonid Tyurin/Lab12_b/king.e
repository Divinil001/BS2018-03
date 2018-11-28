class
	KING

inherit

	PIECE

create
	make

feature

	can_move (new_pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		do
			Result := (coordinates.x - new_pos.x).abs <= 1 and then (coordinates.y - new_pos.y).abs <= 1 and then (attached board [new_pos.x, new_pos.y] as f implies f.get_color /= color)
		end

end
