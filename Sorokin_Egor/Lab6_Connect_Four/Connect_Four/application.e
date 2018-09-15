class
	APPLICATION

create
	make

feature {NONE}  --| The game

	player1, player2: STRING
	m, n: INTEGER_32
	win: BOOLEAN
	no_empty_spaces: BOOLEAN
	field: ARRAY2[INTEGER]

	make  --| Beginning of the game
		do
			registration

			create field.make_filled (-1, 1, 1)

			field_create
			draw_field

			from
			until
				win or no_empty_spaces
			loop
				player1_move
				if
					not win and not no_empty_spaces
				then
					player2_move
				end
			end
		end

feature  --| Player's registration
	registration
		do
			Io.put_string ("Enter the name of the first player: ")
			Io.read_line
			player1 := ""
			player1.copy (Io.last_string)

			Io.put_string ("Enter the name of the second player: ")
			Io.read_line
			player2 := ""
			player2.copy (Io.last_string)
		end

feature  --| Field creating

	field_create
		do
			win := false
			no_empty_spaces := false

			Io.put_string ("Enter number of the rows: ")
			Io.read_integer_32
			m := Io.last_integer_32

			Io.put_string ("Enter number of the columns: ")
			Io.read_integer_32
			n := Io.last_integer_32

			if
				m >= 4 and n >= 4
			then
				create field.make_filled (0, m, n)
			else
				Io.put_string ("Amount of rows and columns must be more than 4.%NPlease, enter numbers again.%N")
				field_create
			end
		end

feature  --| Drawing field in the console
	i, j: INTEGER_32
	str: STRING

	draw_field
		do
			str := "-"
			str.multiply(2 * n - 1)
			Io.put_string (str + "%N")
			from
				i := 1
			until
				i > m
			loop
				from
					j := 1
				until
					j > n
				loop
					Io.put_integer_32 (field[i, j])
					Io.put_string (" ")
					j := j + 1
				end
				Io.put_string ("%N")
				i := i + 1
			end
			Io.put_string (str + "%N")
		end

feature  --| Making a move
	col: INTEGER_32
	flag: BOOLEAN

	player1_move
		do
			Io.put_string (player1 + ", choose a column: ")
			Io.read_integer_32
			col := Io.last_integer_32

			if
				col > n
			then
				Io.put_string ("Chosen column is too big, please, choose another one.%N")
				player1_move
			else
				flag := false
				from
					i := m
				until
					((i < 1) or flag)
				loop
					if
						field[i, col] = 0
					then
						flag := true
						field[i, col] := 1
					end
					i := i - 1
				end

				if
					not flag
				then
					Io.put_string ("There is no free space in this column. Please, choose another one.%N")
					player1_move
				end
			end
			draw_field
			checking
		end

		player2_move
		do
			Io.put_string (player2 + ", choose a column: ")
			Io.read_integer_32
			col := Io.last_integer_32

			if
				col > n
			then
				Io.put_string ("Chosen column is too big, please, choose another one.%N")
				player2_move
			else
				flag := false
				from
					i := m
				until
					((i < 1) or flag)
				loop
					if
						field[i, col] = 0
					then
						flag := true
						field[i, col] := 2
					end
					i := i - 1
				end

				if
					not flag
				then
					Io.put_string ("There is no free space in this column. Please, choose another one.%N")
					player1_move
				end
			end
			draw_field
			checking
		end

feature  --| Win checking
	found: BOOLEAN
	counter: INTEGER
	k:INTEGER_32

	checking
		do
			check_hor
			check_ver
			check_diag1
			check_diag2
			check_diag3
			check_diag4
			check_spaces
		end

	check_hor
		do
			found := false
			counter := 1
			from
				i := 1
			until
				i > m or found
			loop
				from
					j := 2
				until
					j > n or found
				loop
					if
						field[i, j - 1] = field[i, j] and field[i, j] /= 0
					then
						counter := counter + 1
						if
							counter = 4
						then
							found := true
							if
								field[i, j] = 1
							then
								Io.put_string (player1 + " has won!")
							else
								Io.put_string (player2 + " has won!")
							end
							win := true
						end
					else
						counter := 1
					end
					j := j + 1
				end
				i := i + 1
			end
		end

	check_ver
		do
			found := false
			counter := 1
			from
				j := 1
			until
				j > n or found
			loop
				from
					i := 1
				until
					i > m - 1 or found
				loop
					if
						field[i, j] = field[i + 1, j] and field[i + 1, j] /= 0
					then
						counter := counter + 1
						if
							counter = 4
						then
							found := true
							if
								field[i, j] = 1
							then
								Io.put_string (player1 + " has won!")
							else
								Io.put_string (player2 + " has won!")
							end
							win := true
						end
					else
						counter := 1
					end
					i := i + 1
				end
				j := j + 1
			end
		end

	check_diag1
		do
			found := false
			counter := 1

			from
				i := m - 3
			until
				i < 1 or found
			loop
				k := i
				from
					j := 1
				until
					j > n - 1 or found or i >= m
				loop
					if
						field[i, j] = field[i + 1, j + 1] and field[i + 1, j + 1] /= 0
					then
						counter := counter + 1
						if
							counter = 4
						then
							found := true
							if
								field[i, j] = 1
							then
								Io.put_string (player1 + " has won!")
							else
								Io.put_string (player2 + " has won!")
							end
							win := true
						end
					else
						counter := 1
					end
					i := i + 1
					j := j + 1
				end
				i := k
				i := i - 1
			end
		end

	check_diag2
		do
			found := false
			counter := 1

			from
				j := n - 3
			until
				j < 1 or found
			loop
				k := j
				from
					i := 1
				until
					i > m - 1 or found or j >= n
				loop
					if
						field[i, j] = field[i + 1, j + 1] and field[i + 1, j + 1] /= 0
					then
						counter := counter + 1
						if
							counter = 4
						then
							found := true
							if
								field[i, j] = 1
							then
								Io.put_string (player1 + " has won!")
							else
								Io.put_string (player2 + " has won!")
							end
							win := true
						end
					else
						counter := 1
					end
					i := i + 1
					j := j + 1
				end
				j := k
				j := j - 1
			end
		end

	check_diag3
		do
			found := false
			counter := 1

			from
				i := m - 3
			until
				i < 1 or found
			loop
				k := i
				from
					j := n
				until
					j < 2 or found or i >= m
				loop
					if
						field[i, j] = field[i + 1, j - 1] and field[i + 1, j - 1] /= 0
					then
						counter := counter + 1
						if
							counter = 4
						then
							found := true
							if
								field[i, j] = 1
							then
								Io.put_string (player1 + " has won!")
							else
								Io.put_string (player2 + " has won!")
							end
							win := true
						end
					else
						counter := 1
					end
					i := i + 1
					j := j - 1
				end
				i := k
				i := i - 1
			end
		end

	check_diag4
		do
			found := false
			counter := 1

			from
				j := 4
			until
				j > n or found
			loop
				k := j
				from
					i := 1
				until
					i > m - 1 or found or j < 2
				loop
					if
						field[i, j] = field[i + 1, j - 1] and field[i + 1, j - 1] /= 0
					then
						counter := counter + 1
						if
							counter = 4
						then
							found := true
							if
								field[i, j] = 1
							then
								Io.put_string (player1 + " has won!")
							else
								Io.put_string (player2 + " has won!")
							end
							win := true
						end
					else
						counter := 1
					end
					i := i + 1
					j := j - 1
				end
				j := k
				j := j + 1
			end
		end

feature  --| Checking for empty space
	space_flag: BOOLEAN

	check_spaces
		do
			space_flag := false
			from
				j := 1
			until
				j > n or space_flag
			loop
				if
					field[1, j] = 0
				then
					space_flag := true
				end
				j := j + 1
			end
			if
				not space_flag
			then
				no_empty_spaces := true
				Io.put_string ("Draw!%NBecause there is no more space to play!")
			end
		end
end
