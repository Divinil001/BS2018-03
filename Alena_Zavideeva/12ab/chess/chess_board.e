class
	CHESS_BOARD

create
	make

feature

	board: ARRAY2 [detachable PIECE]

	make
		do
			create board.make_filled (Void, 8, 8)
		end

	print_board
		local
			i, j: INTEGER
		do
			from
				i := 1
			until
				i > 8
			loop
				from
					j := 1
				until
					j > 8
				loop
					if attached board [i, j] as b then
						print (b.get_name + "    ")
					else
						print ("....    ")
					end
					j := j + 1
				end
				i := i + 1
				print ("%N")
			end
			print ("%N%N")
		end

	can_move (pos1, pos2: POSITION): BOOLEAN
		local
			dir_x, dir_y, x, y: INTEGER
		do
			if attached board [pos1.x, pos1.y] as b then
				if b.can_move (pos2) then
					if attached {KNIGHT} b then
						Result := attached board [pos2.x, pos2.y] as m implies (not (m.get_color ~ b.get_color))
					else
						Result := True
						from
							dir_x := pos2.x - pos1.x
							dir_y := pos2.y - pos1.y
							x := pos1.x + dir_x
							y := pos1.y + dir_y
						until
							(x = pos2.x and pos2.y = y) or not Result
						loop
							if attached board [x, y] then
								Result := False
							end
							x := x + dir_x
							y := y + dir_y
						end
						Result := Result and (attached board [pos2.x, pos2.y] as m implies (not (m.get_color ~ b.get_color)))
					end
				else
					Result := False
				end
			else
				Result := False
			end
		end

	move_piece (pos1, pos2: POSITION)
		require
			can_move (pos1, pos2)
		do
			if attached board [pos1.x, pos1.y] as b then
				b.move (pos2)
				board [pos1.x, pos1.y] := Void
				board [pos2.x, pos2.y] := b
			end
		end

end
