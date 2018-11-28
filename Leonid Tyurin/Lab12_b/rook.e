class
	ROOK

inherit

	PIECE

create
	make

feature

	can_move (new_pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		local
			i: INTEGER
			err: BOOLEAN
		do
			if (coordinates.x - new_pos.x) = 0 then
				from
					i := coordinates.y.min (new_pos.y)
				until
					err or else i > coordinates.y.max (new_pos.y)
				loop
					if attached board [new_pos.x, i] as f implies (i = coordinates.y.max (new_pos.y) and then (f = Current or else f.get_color /= get_color)) then
						err := false
					else
						err := true
					end
					i := i + 1
				end
				Result := not err
			else
				if (coordinates.y - new_pos.y) = 0 then
					from
						i := coordinates.x.min (new_pos.x)
					until
						err or else i > coordinates.x.max (new_pos.x)
					loop
						if attached board [i, new_pos.y] as f implies (i = coordinates.x.max (new_pos.x) and then (f = Current or else f.get_color /= get_color)) then
							err := false
						else
							err := true
						end
						i := i + 1
					end
					Result := not err
				else
					Result := false
				end
			end
		end

end
