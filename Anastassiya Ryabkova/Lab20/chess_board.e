note
	description: "Summary description for {CHESS_BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CHESS_BOARD

create
	make

feature -- Constructor
	make
		local -- _w means white and _b means black
			kw, kb:detachable KING
			qw, qb:detachable QUEEN
			rw1, rw2, rb1, rb2:detachable ROOK
			nw1, nw2, nb1, nb2:detachable KNIGHT
			bw1, bw2, bb1, bb2:detachable BISHOP
			pw1, pw2, pw3, pw4, pw5, pw6, pw7, pw8, pb1, pb2, pb3, pb4, pb5, pb6, pb7, pb8:detachable PAWN
			i:INTEGER
			the_end, correct_move:BOOLEAN
		do
			create chess_board.make_filled (Void, 8, 8)
			create kw.make(0, [8, 5])
			create kb.make(1, [1, 5])
			create qw.make(0, [8, 4])
			create qb.make(1, [1, 4])
			create rw1.make(0, [8, 1])
			create rw2.make(0, [8, 8])
			create rb1.make(1, [1, 1])
			create rb2.make(1, [1, 8])

			create nw1.make(0, [8, 2])
			create nw2.make(0, [8, 7])
			create nb1.make(1, [1, 2])
			create nb2.make(1, [1, 7])

			create bw1.make(0, [8, 3])
			create bw2.make(0, [8, 6])
			create bb1.make(1, [1, 3])
			create bb2.make(1, [1, 6])

			create pw1.make(0, [7, 1])
			create pw2.make(0, [7, 2])
			create pw3.make(0, [7, 3])
			create pw4.make(0, [7, 4])
			create pw5.make(0, [7, 5])
			create pw6.make(0, [7, 6])
			create pw7.make(0, [7, 7])
			create pw8.make(0, [7, 8])

			create pb1.make(1, [2, 1])
			create pb2.make(1, [2, 2])
			create pb3.make(1, [2, 3])
			create pb4.make(1, [2, 4])
			create pb5.make(1, [2, 5])
			create pb6.make(1, [2, 6])
			create pb7.make(1, [2, 7])
			create pb8.make(1, [2, 8])

			chess_board.item(8, 1) := rw1
			chess_board.item(8, 2) := nw1
			chess_board.item(8, 3) := bw1
			chess_board.item(8, 4) := qw
			chess_board.item(8, 5) := kw
			chess_board.item(8, 6) := bw2
			chess_board.item(8, 7) := nw2
			chess_board.item(8, 8) := rw2
			chess_board.item(7, 1) := pw1
			chess_board.item(7, 2) := pw2
			chess_board.item(7, 3) := pw3
			chess_board.item(7, 4) := pw4
			chess_board.item(7, 5) := pw5
			chess_board.item(7, 6) := pw6
			chess_board.item(7, 7) := pw7
			chess_board.item(7, 8) := pw8

			chess_board.item(1, 1) := rb1
			chess_board.item(1, 2) := nb1
			chess_board.item(1, 3) := bb1
			chess_board.item(1, 4) := qb
			chess_board.item(1, 5) := kb
			chess_board.item(1, 6) := bb2
			chess_board.item(1, 7) := nb2
			chess_board.item(1, 8) := rb2
			chess_board.item(2, 1) := pb1
			chess_board.item(2, 2) := pb2
			chess_board.item(2, 3) := pb3
			chess_board.item(2, 4) := pb4
			chess_board.item(2, 5) := pb5
			chess_board.item(2, 6) := pb6
			chess_board.item(2, 7) := pb7
			chess_board.item(2, 8) := pb8

			-- Game process
			print("Welcome, this is the chess game%N")
			print("The rules are simpler than in ordinary chess%N")
			print("There is no castling, and en passant rule%N")
			print("King can attack pieces under protection, but you can capture king as well as the other features%N")
			print("If a pawn get to last raw, it always becomes a queen%N")
			print("To win this game you should capture opponent's king%N")
			print("%N")
			print("To make a move write 'l1n1 l2n2' , for example e2 e4 (there must be only one space!)%N")
			print("Like in ususal chess game%N")
			print("%N")

			display
			print("%N")

			from
				i := 0
			until
				the_end
			loop
				if i \\ 2 = 0 then
					from
					until
						correct_move
					loop
						print("White's turn: ")
						correct_move := player_move(0)
					end
				else
					from
					until
						correct_move
					loop
						print("Black's turn: ")
						correct_move := player_move(1)
					end
				end
				print("%N")
				display
				print("%N")
				correct_move := false
				i := i + 1
				if who_win = 0 then
					the_end := true
					print("CHECKMATE  White wins%N")
				elseif who_win = 1 then
					the_end := true
					print("CHECKMATE  Black wins%N")
				end
			end
		end

feature {NONE}
	player_move(player:INTEGER):BOOLEAN
		local
			move, s1, s2:STRING
			p1, p2:TUPLE[INTEGER, INTEGER]
			correct_input:BOOLEAN
		do
			from
			until
				correct_input
			loop
				Io.read_line
				if Io.last_string.count = 5 then
					correct_input := true
				else
					print("Incorrect output%N")
				end
			end
			move := Io.last_string
			s1 := move.substring (1, 2)
			s2 := move.substring (4, 5)
			create p1.default_create
			create p2.default_create
			if s1.item (1).out.is_equal ("a") then
				p1 := [9 - s1.item (2).out.to_integer, 1]
			elseif s1.item (1).out.is_equal ("b") then
				p1 := [9 - s1.item (2).out.to_integer, 2]
			elseif s1.item (1).out.is_equal ("c") then
				p1 := [9 - s1.item (2).out.to_integer, 3]
			elseif s1.item (1).out.is_equal ("d") then
				p1 := [9 - s1.item (2).out.to_integer, 4]
			elseif s1.item (1).out.is_equal ("e") then
				p1 := [9 - s1.item (2).out.to_integer, 5]
			elseif s1.item (1).out.is_equal ("f") then
				p1 := [9 - s1.item (2).out.to_integer, 6]
			elseif s1.item (1).out.is_equal ("g") then
				p1 := [9 - s1.item (2).out.to_integer, 7]
			elseif s1.item (1).out.is_equal ("h") then
				p1 := [9 - s1.item (2).out.to_integer, 8]
			end

			if s2.item (1).out.is_equal ("a") then
				p2 := [9 - s2.item (2).out.to_integer, 1]
			elseif s2.item (1).out.is_equal ("b") then
				p2 := [9 - s2.item (2).out.to_integer, 2]
			elseif s2.item (1).out.is_equal ("c") then
				p2 := [9 - s2.item (2).out.to_integer, 3]
			elseif s2.item (1).out.is_equal ("d") then
				p2 := [9 - s2.item (2).out.to_integer, 4]
			elseif s2.item (1).out.is_equal ("e") then
				p2 := [9 - s2.item (2).out.to_integer, 5]
			elseif s2.item (1).out.is_equal ("f") then
				p2 := [9 - s2.item (2).out.to_integer, 6]
			elseif s2.item (1).out.is_equal ("g") then
				p2 := [9 - s2.item (2).out.to_integer, 7]
			elseif s2.item (1).out.is_equal ("h") then
				p2 := [9 - s2.item (2).out.to_integer, 8]
			end

			if attached {PIECE} chess_board.item (p1.integer_32_item (1), p1.integer_32_item (2)) as piece then
				if player = piece.colour then
					if move_piece (p1, p2) then
						Result := true
					else
						print("This movement is impossible, please try again%N")
					end
				else
					print("You cannot move opponent's pieces%N")
					print("Please try again%N")
				end
			end
		end

	who_win:INTEGER
		local
			white, black:INTEGER
		do
			across
				chess_board as c
			loop
				if attached {KING} c.item as king then
					if king.colour = 0 then
						white := white + 1
					elseif king.colour = 1 then
						black := black + 1
					end
				end
			end
			if white = 0 then
				Result := 0
			elseif black = 0 then
				Result := 1
			else
				Result := -1
			end
		end

feature -- Queries
	chess_board:ARRAY2[detachable PIECE]

	pawn_to_queen_w, pawn_to_queen_b:BOOLEAN

	can_move(p1, p2:TUPLE[INTEGER, INTEGER]):BOOLEAN
		local
			i, j:INTEGER
			piece_on_way:BOOLEAN
		do
			if attached {PIECE} chess_board.item (p1.integer_32_item (1), p1.integer_32_item (2)) as piece then
				-- Check for a pawn (without "en passant")
				if attached {PAWN} piece as pawn then
					if pawn.can_move (p2) then
						if pawn.first_move then
							if pawn.colour = 0 then
								if p2.integer_32_item (1) = p1.integer_32_item (1) - 1 then
									if chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) = Void then
										pawn.not_first_move
										Result := true
									end
								else
									if chess_board.item (p1.integer_32_item (1) - 1, p1.integer_32_item (2)) = Void then
										if chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) = Void then
											pawn.not_first_move
											Result := true
										end
									end
								end
							elseif pawn.colour = 1 then
								if p2.integer_32_item (1) = p1.integer_32_item (1) + 1 then
									if chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) = Void then
										pawn.not_first_move
										Result := true
									end
								else
									if chess_board.item (p1.integer_32_item (1) + 1, p1.integer_32_item (2)) = Void then
										if chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) = Void then
											pawn.not_first_move
											Result := true
										end
									end
								end
							end
						else
							if pawn.colour = 0 then
								if chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) = Void then
									Result := true
								end
							elseif pawn.colour = 1 then
								if chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) = Void then
									Result := true
								end
							end
						end
					elseif pawn.colour = 0 and ((p2.integer_32_item (1) = p1.integer_32_item (1) - 1 and p2.integer_32_item (2) = p1.integer_32_item (2) - 1) or
					(p2.integer_32_item (1) = p1.integer_32_item (1) - 1 and p2.integer_32_item (2) = p1.integer_32_item (2) + 1)) then
						if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
							if another_piece.colour = 1 then
								Result := true
							end
						end
					elseif pawn.colour = 1 and ((p2.integer_32_item (1) = p1.integer_32_item (1) + 1 and p2.integer_32_item (2) = p1.integer_32_item (2) - 1) or
					(p2.integer_32_item (1) = p1.integer_32_item (1) + 1 and p2.integer_32_item (2) = p1.integer_32_item (2) + 1)) then
						if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
							if another_piece.colour = 0 then
								Result := true
							end
						end
					end

					if Result then
						if pawn.colour = 0 and p2.integer_32_item (1) = 1 then
							pawn_to_queen_w := true
						elseif pawn.colour = 1 and p2.integer_32_item (1) = 8 then
							pawn_to_queen_b := true
						end
					end
				-- Check for a knight
				elseif attached {KNIGHT} piece as knight then
					if knight.can_move (p2) then
						if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
							if another_piece.colour /= knight.colour then
								Result := true
							end
						else
							Result := true
						end
					end
				-- Check for a king (for simplicity king can capture opponent's figures even if they are under protection, but cannot capture opponent's king.
				-- If king is captured, then opponent wins)
				elseif attached {KING} piece as king then
					if king.can_move (p2) then
						if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
							if attached {KING} another_piece as another_king then
							else
								if another_piece.colour /= king.colour then
									Result := true
								end
							end
						else
							Result := true
						end
					end
				-- Check for a bishop
				elseif attached {BISHOP} piece as bishop then
					if bishop.can_move (p2) then
						if p2.integer_32_item (1) = p2.integer_32_item (2) + (bishop.position.integer_32_item (1) - bishop.position.integer_32_item (2)) then
							if p2.integer_32_item (1) > bishop.position.integer_32_item (1) then
								from
									i := bishop.position.integer_32_item (1) + 1
									j := bishop.position.integer_32_item (2) + 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i + 1
									j := j + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= bishop.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									i := bishop.position.integer_32_item (1) - 1
									j := bishop.position.integer_32_item (2) - 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i - 1
									j := j - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= bishop.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						else
							if p2.integer_32_item (1) > bishop.position.integer_32_item (1) then
								from
									i := bishop.position.integer_32_item (1) + 1
									j := bishop.position.integer_32_item (2) - 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i + 1
									j := j - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= bishop.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									i := bishop.position.integer_32_item (1) - 1
									j := bishop.position.integer_32_item (2) + 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i - 1
									j := j + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= bishop.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						end
					end
				-- Check for a rook
				elseif attached {ROOK} piece as rook then
					if rook.can_move (p2) then
						if p2.integer_32_item (2) = rook.position.integer_32_item (2) then
							if p2.integer_32_item (1) > rook.position.integer_32_item (1) then
								from
									i := rook.position.integer_32_item (1) + 1
								until
									not (i /= p2.integer_32_item (1))
								loop
									if attached {PIECE} chess_board.item (i, rook.position.integer_32_item (2)) as another_piece then
										piece_on_way := true
									end
									i := i + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= rook.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									i := rook.position.integer_32_item (1) - 1
								until
									not (i /= p2.integer_32_item (1))
								loop
									if attached {PIECE} chess_board.item (i, rook.position.integer_32_item (2)) as another_piece then
										piece_on_way := true
									end
									i := i - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= rook.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						else
							if p2.integer_32_item (2) > rook.position.integer_32_item (2) then
								from
									j := rook.position.integer_32_item (2) + 1
								until
									not (j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), j) as another_piece then
										piece_on_way := true
									end
									j := j + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= rook.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									j := rook.position.integer_32_item (2) - 1
								until
									not (j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), j) as another_piece then
										piece_on_way := true
									end
									j := j - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= rook.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						end
					end
				-- Check for a queen
				elseif attached {QUEEN} piece as queen then
					if queen.can_move (p2) then
						if p2.integer_32_item (1) = p2.integer_32_item (2) + (queen.position.integer_32_item (1) - queen.position.integer_32_item (2)) then
							if p2.integer_32_item (1) > queen.position.integer_32_item (1) then
								from
									i := queen.position.integer_32_item (1) + 1
									j := queen.position.integer_32_item (2) + 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i + 1
									j := j + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									i := queen.position.integer_32_item (1) - 1
									j := queen.position.integer_32_item (2) - 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i - 1
									j := j - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						elseif p2.integer_32_item (1) - p1.integer_32_item (1) = p1.integer_32_item (2) - p2.integer_32_item (2) then
							if p2.integer_32_item (1) > queen.position.integer_32_item (1) then
								from
									i := queen.position.integer_32_item (1) + 1
									j := queen.position.integer_32_item (2) - 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i + 1
									j := j - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									i := queen.position.integer_32_item (1) - 1
									j := queen.position.integer_32_item (2) + 1
								until
									not (i /= p2.integer_32_item (1) and j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (i, j) as another_piece then
										piece_on_way := true
									end
									i := i - 1
									j := j + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						end
						if p2.integer_32_item (2) = queen.position.integer_32_item (2) then
							if p2.integer_32_item (1) > queen.position.integer_32_item (1) then
								from
									i := queen.position.integer_32_item (1) + 1
								until
									not (i /= p2.integer_32_item (1))
								loop
									if attached {PIECE} chess_board.item (i, queen.position.integer_32_item (2)) as another_piece then
										piece_on_way := true
									end
									i := i + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									i := queen.position.integer_32_item (1) - 1
								until
									not (i /= p2.integer_32_item (1))
								loop
									if attached {PIECE} chess_board.item (i, queen.position.integer_32_item (2)) as another_piece then
										piece_on_way := true
									end
									i := i - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						else
							if p2.integer_32_item (2) > queen.position.integer_32_item (2) then
								from
									j := queen.position.integer_32_item (2) + 1
								until
									not (j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), j) as another_piece then
										piece_on_way := true
									end
									j := j + 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							else
								from
									j := queen.position.integer_32_item (2) - 1
								until
									not (j /= p2.integer_32_item (2))
								loop
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), j) as another_piece then
										piece_on_way := true
									end
									j := j - 1
								end
								if piece_on_way = false then
									if attached {PIECE} chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) as another_piece then
										if another_piece.colour /= queen.colour then
											Result := true
										end
									else
										Result := true
									end
								end
							end
						end
					end
				end
			end
		end

feature -- Commands
	move_piece(p1, p2:TUPLE[INTEGER, INTEGER]):BOOLEAN
		local
			q:detachable QUEEN
		do
			if attached {PIECE} chess_board.item (p1.integer_32_item (1), p1.integer_32_item (2)) as piece then
				if can_move(p1, p2) then
					Result := true
					piece.move (p2)
					chess_board.item (p1.integer_32_item (1), p1.integer_32_item (2)) := Void
					chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) := Void
					if pawn_to_queen_w then
						create q.make (0, p2)
						chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) := q
						pawn_to_queen_w := false
					elseif pawn_to_queen_b then
						create q.make (1, p2)
						chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) := q
						pawn_to_queen_b := false
					else
						chess_board.item (p2.integer_32_item (1), p2.integer_32_item (2)) := piece
					end
				end
			end
		end

	display
		local
			i, j:INTEGER
		do
			from
				i := 1
			until
				not (i <= chess_board.height)
			loop
				print((9 - i).out + " ")
				from
					j := 1
				until
					not (j <= chess_board.width)
				loop
					if attached chess_board.item (i, j) as p then
						p.display
						print("  ")
					else
						print("__  ")
					end
					j := j + 1
				end
				print("%N")
				i := i + 1
			end
			print("   A   B   C   D   E   F   G   H")
		end

invariant
	correct_bounds: chess_board.height = 8 and chess_board.width = 8

end
