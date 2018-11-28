class
	BISHOP

inherit

	PIECE

create
	make

feature

	can_move (new_pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		local
			i, j, dx, dy: INTEGER
			err: BOOLEAN
		do
			if (coordinates.x - new_pos.x).abs = (coordinates.y - new_pos.y).abs then
				if coordinates.x < new_pos.x then
					dx := 1
				else
					dx := -1
				end
				if coordinates.y < new_pos.y then
					dy := 1
				else
					dy := -1
				end
				from
					i := coordinates.x + dx
					j := coordinates.y + dy
				until
					i = new_pos.x + dx or else j = new_pos.y + dy
				loop
					if attached board [i, j] as f implies (i = coordinates.x and then j = coordinates.y and then f.get_color /= get_color) then
						err := false
					else
						err := true
					end
					j := j + dy
					i := i + dx
				end
			else
				err := true
			end
			Result := not err
		end

end

