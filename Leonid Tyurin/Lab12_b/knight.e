class
	KNIGHT

inherit

	PIECE

create
	make

feature

	can_move (new_pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		do
			if (attached board [new_pos.x, new_pos.y] as f implies f.get_color /= color) and then (new_pos ~ [coordinates.x + 2, coordinates.y + 3] or else new_pos ~ [coordinates.x + 3, coordinates.y + 2] or else new_pos ~ [coordinates.x + 3, coordinates.y - 2] or else new_pos ~ [coordinates.x + 2, coordinates.y - 3] or else new_pos ~ [coordinates.x - 2, coordinates.y - 3] or else new_pos ~ [coordinates.x - 3, coordinates.y - 2] or else new_pos ~ [coordinates.x - 3, coordinates.y + 2] or else new_pos ~ [coordinates.x - 2, coordinates.y + 3]) then
				Result := true
			else
				Result := false
			end
		end

end
