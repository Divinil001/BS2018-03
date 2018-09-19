dclass
	GAME
create
	make
feature
	make
		local
			tmp_m: INTEGER
			tmp_n: INTEGER
			tmp: INTEGER
		do
			player := 1
			is_win := false

			print("Enter number of rows: ")
			Io.read_integer
			tmp_m:= Io.last_integer+0
			print("Enter number of columns: ")
			Io.read_integer
			tmp_n:= Io.last_integer+0

			create b.make (tmp_m, tmp_n)

			from
			until
				not b.is_have_place or is_win
			loop
				b.print_matrix
				print("Player " + player.out + " turn: ")
				Io.read_integer_32
				tmp := Io.last_integer_32 + 0

				b.drop_check (tmp.as_integer_32, player)

				if b.parser then
					print("Winner is " + player.out)
					is_win := true
				end
				player := change (player)
			end

		end
feature
	b: BOARD
	player: INTEGER
	is_win: BOOLEAN
	change(p: INTEGER): INTEGER
		do
			if p = 1 then
				Result := 2
			else
				Result := 1
			end
		end


end
