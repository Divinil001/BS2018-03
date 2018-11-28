class
	PAWN

inherit

	PIECE

create
	make

feature

	steps_done: INTEGER

	can_move (new_pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		local
			dy: INTEGER
		do
			if steps_done = 0 then
				dy := 2
			else
				dy := 1
			end
			if get_color then
				Result := new_pos.y = coordinates.y - dy or else (new_pos.y = coordinates.y - dy + 1 and then new_pos /~ coordinates)
			else
				Result := new_pos.y = coordinates.y + dy or else (new_pos.y = coordinates.y + dy - 1 and then new_pos /~ coordinates)
			end
			inspect (coordinates.x - new_pos.x).abs
			when 0 then
				Result := Result
			when 1 then
				Result := Result and then (attached board [new_pos.x, new_pos.y] as f and then f.get_color /= get_color)
			else
				Result := false
			end
			if Result = true then
				steps_done := steps_done + 1
			end
		end

end

