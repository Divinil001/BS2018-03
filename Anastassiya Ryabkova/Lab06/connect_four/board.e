note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

create make

feature
	board:ARRAY2[INTEGER]

	make(m:INTEGER; n:INTEGER)
		do
			create board.make_filled (0, m, n)
		end

	make_turn(m,n,player_number:INTEGER; current_player:INTEGER)
	local	i:INTEGER
		turn:BOOLEAN
		do
			create turn

			from
				i := m  --rows
			until
				turn or i <= -1
			loop
					board.put (player_number, i, n)
					turn := true

			end
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

					check_win:BOOLEAN
						do

							result := horizontal_check or vertical_check
						end





end -- end class
