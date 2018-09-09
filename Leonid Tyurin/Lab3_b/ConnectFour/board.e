note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

inherit
	ARGUMENTS

create
	make

feature

	board:ARRAY2[CHARACTER]

	make(m, n : INTEGER)
		do
			create board.make_filled (' ', m, n)
		end

	make_turn(curr_player_chip:CHARACTER; curr_player, m, n:INTEGER)
		local
			i:INTEGER
			flag:BOOLEAN
		do
			flag := false

			from
				i := m  --rows
			until
				flag or i <= -1
			loop
				if i = 0 then
					print("Turn is not available!!!%NRemake your turn!%N")
					flag := true
					io.put_string ("Player " + curr_player.out + " turn ")
					io.read_integer
					make_turn(curr_player_chip, curr_player, m, io.last_integer)
				elseif board.item (i, n) /= ' ' then
					i := i - 1
				else
					board.put (curr_player_chip, i, n)
					flag := true
				end
			end
		end

	check_win:BOOLEAN
		do

			result := horizontal_check or vertical_check or right_diagonal_check or left_diagonal_check
		end

	horizontal_check : BOOLEAN
		local
			i, j:INTEGER
		do
			from
				i := 1  --rows
			until
				i = board.height + 1
			loop
				from
					j := 1 --columns
				until
					j = board.width + 1 - 3
				loop
					if board.item (i, j) /= ' '
					   and board.item (i, j) = board.item (i, j + 1)
					   and board.item (i, j + 1) = board.item (i, j + 2)
					   and board.item (i, j + 2) = board.item (i, j + 3)
					then
						result := true
					end
					j := j + 1
				end
				i := i + 1
			end
		end

		vertical_check : BOOLEAN
		local
			i, j:INTEGER
		do
			from
				i := 1  --rows
			until
				i = board.height + 1 - 3
			loop
				from
					j := 1 --columns
				until
					j = board.width + 1
				loop
					if board.item (i, j) /= ' '
					   and board.item (i, j) = board.item (i + 1, j)
					   and board.item (i + 1, j) = board.item (i + 2, j)
					   and board.item (i + 2, j) = board.item (i + 3, j)
					then
						result := true
					end
					j := j + 1
				end
				i := i + 1
			end
		end

		left_diagonal_check : BOOLEAN
		local
			i, j:INTEGER
		do
			from
				i := 1  --rows
			until
				i = board.height + 1 - 3
			loop
				from
					j := 1 --columns
				until
					j = board.width + 1 - 3
				loop
					if board.item (i, j) /= ' '
					   and board.item (i, j) = board.item (i + 1, j + 1)
					   and board.item (i + 1, j + 1) = board.item (i + 2, j + 2)
					   and board.item (i + 2, j + 2) = board.item (i + 3, j + 3)
					then
						result := true
					end
					j := j + 1
				end
				i := i + 1
			end
		end

		right_diagonal_check : BOOLEAN
		local
			i, j:INTEGER
		do
			from
				i := 1  --rows
			until
				i = board.height + 1 - 3
			loop
				from
					j := 1 --columns
				until
					j = board.width + 1 - 3
				loop
					if board.item (i + 3, j) /= ' '
					   and board.item (i + 3, j) = board.item (i + 2, j + 1)
					   and board.item (i + 2, j + 1) = board.item (i + 1, j + 2)
					   and board.item (i + 1, j + 2) = board.item (i, j + 3)
					then
						result := true
					end

					j := j + 1
				end
				i := i + 1
			end
		end


	board_out
		local
			i, j :INTEGER
		do
			from
				i := 1    --rows
			until
				i = board.height + 1
			loop
				from
					j := 1   --columns
				until
					j = board.width + 1
				loop
					io.put_string ("[" + board[i, j].out + "]" + " ")
					j := j + 1
				end
				io.new_line
				i := i + 1
			end
		end

	is_board_full:BOOLEAN
		local
			i:INTEGER
		do
			from
				i := 1
			until
				i = board.width + 1
			loop
				result := true
				if board.item (1, i) = ' ' then
					result := false
				end
				i := i + 1
			end

		end
end
