class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			-- Board init
			init_board
			from
				winner := 0
				current_player := 1
			until
				is_finished
			loop
				make_move
			end
		end

	make_move
		local
			column: INTEGER
		do
			io.put_string (current_player.out + " player's turn %NEnter the column >> ")
			from
				column := -1
			until
				is_valid_column(column)
			loop
				io.read_integer
				column := io.last_integer
				if is_valid_column(column) ~ False then
					system("cls")
					print_board
					io.put_string ("Error. Try again >> ")
				end
			end
			put_disc(column)
		end

	check_winner(row, column: INTEGER)
		local
			is_winner: BOOLEAN
		do
			is_winner := check_horizontal(row, column) or check_vertical(row, column) or check_diagonal(row, column)
			if is_winner then
				is_finished := True
				io.put_string ("Game finished! " + current_player.out + " player's is a winner!")
			elseif filled_cells ~ n*m then
				is_finished := True
				io.put_string ("Game finished!... but there is no winner :(")
			end
		end

	check_horizontal(row, column: INTEGER): BOOLEAN
		local
			i, count: INTEGER
			found: BOOLEAN
		do
			from
				i := max(1, column - 3)
				count := 0
				found := False
			until
				i > min(m, column + 3) or found
			loop
				if board.item (row, i) ~ current_player then
					count := count + 1
				else
					count := 0
				end
				if count ~ 4 then
					found := True
				end
				i := i + 1
			end
			Result := found
		end

	check_vertical(row, column: INTEGER): BOOLEAN
		local
			i, count: INTEGER
			found: BOOLEAN
		do
			from
				i := max(1, row - 3)
				count := 0
				found := False
			until
				i > min(n, row + 3) or found
			loop
				if board.item (i, column) ~ current_player then
					count := count + 1
				else
					count := 0
				end
				if count ~ 4 then
					found := True
				end
				i := i + 1
			end
			Result := found
		end

	check_diagonal(row, column: INTEGER): BOOLEAN
		local
			min_max_diagonal: ARRAYED_LIST[INTEGER]
			i, j, count: INTEGER
			found: BOOLEAN
		do
			min_max_diagonal := get_min_max_diagonal(row, column)
			from
				i := min_max_diagonal[1]
				j := min_max_diagonal[2]
				found := False
				count := 0
			until
				i > min_max_diagonal[3] or j > min_max_diagonal[4] or found
			loop
				if board.item (i ,j) ~ current_player then
					count := count + 1
				else
					count := 0
				end
				if count ~ 4 then
					found := True
				end
				i := i + 1
				j := j + 1
			end

			from
				i := min_max_diagonal[5]
				j := min_max_diagonal[6]
				count := 0
			until
				i < min_max_diagonal[7] or j > min_max_diagonal[8] or found
			loop
				if board.item (i ,j) ~ current_player then
					count := count + 1
				else
					count := 0
				end
				if count ~ 4 then
					found := True
				end
				i := i - 1
				j := j + 1
			end
			Result := found
		end

	get_min_max_diagonal(row, column: INTEGER): ARRAYED_LIST[INTEGER]
		local
			i, j, k, l, o, p, q, r: INTEGER
			ans: ARRAYED_LIST[INTEGER]
		do
			create ans.make (0)
			from
				i := row
				j := column
			until
				i < 2 or j < 2 or row - i > 3
			loop
				i := i - 1;
				j := j - 1;
			end

			from
				k := row
				l := column
			until
				k > n-1 or l > m-1 or k - row > 3
			loop
				k := k + 1;
				l := l + 1;
			end

			from
				o := row
				p := column
			until
				o < 2 or p > m-1 or p - column > 3
			loop
				o := o - 1;
				p := p + 1;
			end

			from
				q := row
				r := column
			until
				q > n-1 or r < 2 or q - row > 3
			loop
				q := q + 1;
				r := r - 1;
			end
			ans.extend (i)
			ans.extend (j)
			ans.extend (k)
			ans.extend (l)
			ans.extend (q)
			ans.extend (r)
			ans.extend (o)
			ans.extend (p)
			Result := ans
		end

	put_disc(column: INTEGER)
		local
			i: INTEGER
			is_found: BOOLEAN
		do
			from
				i := n
				is_found := False
			until
				i < 1 or is_found = True
			loop
				if board.item (i, column) ~ 0 then
					is_found := True
					board.put (current_player, i, column)
					filled_cells := filled_cells + 1
					system("cls")
					print_board
					check_winner(i, column)
					if current_player ~ 1 then
						current_player := 2
					else
						current_player := 1
					end
				end
				i := i - 1
			end
		end

	print_board
		local
			i, j: INTEGER
		do
			from
				i := 1
			until
				i > n
			loop
				from
					j := 1
				until
					j > m
				loop
					io.put_integer (board.item (i, j))
					io.put_string (" ")
					j := j + 1
				end
				io.put_new_line
				i := i + 1
			end
			io.put_new_line
		end

	is_valid_column(column: INTEGER): BOOLEAN
		do
			if column < 1 or column > m or board.item (1, column) /~ 0 then
				Result := False
			else
				Result := True
			end
		end

	init_board
		local
			size_correct: BOOLEAN
		do
			is_finished := False
			filled_cells := 0
			io.put_string ("Enter size of the board (e.g. 6 7)%N")
			from
				size_correct := False
			until
				size_correct = True
			loop
				io.put_string ("Rows >> ")
				io.read_integer
				n := io.last_integer
				io.put_string ("Columns >> ")
				io.read_integer
				m := io.last_integer
				if n > 3 or m > 3 then
					size_correct := True
				else
					io.put_string ("%NThe size is incorrect. Try again%N")
				end
			end
			create board.make_filled (0, n, m)
			io.put_string ("The board successfully created%N")
			io.put_string ("Starting the game %N")
			system("cls")
			print_board
		end

	min(a, b: INTEGER): INTEGER
		do
			if a > b then
				Result := b
			else
				Result := a
			end
		end

	max(a, b: INTEGER): INTEGER
		do
			if a > b then
				Result := a
			else
				Result := b
			end
		end

	n, m, winner, current_player, filled_cells: INTEGER
	board: ARRAY2[INTEGER]
	is_finished: BOOLEAN
end
