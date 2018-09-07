note
	description: "CONNECT_FOUR application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CONNECT_FOUR

inherit
	ARGUMENTS

create
	make

feature
	n : INTEGER
	m : INTEGER
	player : BOOLEAN
	column : INTEGER
	board : ARRAY2[INTEGER]
	empty : INTEGER
	ended : BOOLEAN
	one : INTEGER
	it : INTEGER

feature


	check_win (r : INTEGER; c : INTEGER) : BOOLEAN
		do
			if check_horizontal(r, c) = TRUE or check_vertical(r, c) = TRUE or check_diagonal1(r, c) = TRUE or check_diagonal2(r, c) = TRUE then
				Result := TRUE
			else
				Result := FALSE
			end
		end
	check_horizontal (r : INTEGER; c : INTEGER) : BOOLEAN
		local
			ans : INTEGER
			i : INTEGER
			j : INTEGER
		do
			ans := 0
			from
				i := c
			until
				ans >= 4 or i > m or board[r, i] /= board[r, c]
			loop
				i := i + 1
				ans := ans + 1
			end
			from
				i := c - 1
			until
				ans >= 4 or i <= 0 or board[r, i] /= board[r, c]
			loop
				i := i - 1
				ans := ans + 1
			end
			if ans >= 4 then
				Result := TRUE
			else
				Result := FALSE
			end
			--print("HERE IS OK2%N")
		end
	check_vertical (r : INTEGER; c : INTEGER) : BOOLEAN
		local
			ans : INTEGER
			i : INTEGER
		do
			ans := 0
			from
				i := r
			until
				ans >= 4 or i > n or board[i, c] /= board[r, c]
			loop
				i := i + 1
				ans := ans + 1
			end
			from
				i := r - 1
			until
				ans >= 4 or i <= 0 or board[i, c] /= board[r, c]
			loop
				i := i - 1
				ans := ans + 1
			end
			if ans >= 4 then
				Result := TRUE
			else
				Result := FALSE
			end
			--print("HERE IS OK3%N")
		end
	check_diagonal1 (r : INTEGER; c : INTEGER) : BOOLEAN
		local
			ans : INTEGER
			j : INTEGER
			i : INTEGER
		do
			ans := 0
			from
				i := r
				j := c
			until
				ans >= 4 or i > n or j > m or board[i, j] /= board[r, c]
			loop
				i := i + 1
				j := j + 1
				ans := ans + 1
			end
			--print(ans.out + " ")
			from
				i := r - 1
				j := c - 1
			until
				ans >= 4 or i <= 0 or j <= 0 or board[i, j] /= board[r, c]
			loop
				i := i - 1
				j := j - 1
				ans := ans + 1
			end
			if ans >= 4 then
				Result := TRUE
			else
				Result := FALSE
			end
			--print(ans.out + " ")
			--print("HERE IS OK4%N")
		end
	check_diagonal2 (r : INTEGER; c : INTEGER) : BOOLEAN
		local
			ans : INTEGER
			i : INTEGER
			j : INTEGER
		do
			ans := 0
			from
				i := r
				j := c
			until
				ans >= 4 or i > n or j <= 0 or board[i, j] /= board[r, c]
			loop
				i := i + 1
				j := j - 1
				ans := ans + 1
			end
			from
				i := r - 1
				j := c + 1
			until
				ans >= 4 or i <= 0 or j > m or board[i, j] /= board[r, c]
			loop
				i := i - 1
				j := j + 1
				ans := ans + 1
			end
			if ans >= 4 then
				Result := TRUE
			else
				Result := FALSE
			end
			--print("HERE IS OK5%N")
		end


feature {NONE}
	make
		local
			b : INTEGER
			a : INTEGER
			filled_places : INTEGER
		do
			ended := FALSE
			io.read_integer
			n := io.last_integer
			io.read_integer
			m := io.last_integer
			create board.make_filled (0, n, m)
			from

			until
				ended = TRUE
			loop
				if player = FALSE then
					print("PLAYER1's TURN : ")
				else
					print("PLAYER2's TURN : ")
				end
				io.read_integer
				column := io.last_integer
				if board[1, column] > 0 then
					print("IT IS FULL!%N")
					player := player xor TRUE
				else
					filled_places := filled_places + 1
					from
						it := 1
					until
						it > n or board[it, column] > 0
					loop
						empty := it
						it := it + 1
					end
					if player = FALSE then
						board[empty, column] := 1
					else
						board[empty, column] := 2
					end
					from
						a := 1
					until
						a > n
					loop
						from
							b := 1
						until
							b > m
						loop
							print(board[a, b].out + " ")
							b := b + 1
						end
						a := a + 1
						print("%N")
					end
					--print("HERE IS OK1%N")
					if check_win(empty, column) = TRUE then
						if player = FALSE then
							print("PLAYER 1 wins")
						else
							print("PLAYER 2 wins")
						end
						ended := TRUE
					end
					if ended = FALSE and filled_places = n * m then
						print("DRAW")
						ended := TRUE
					end
				end
				player := player xor TRUE
			end
		end
end
