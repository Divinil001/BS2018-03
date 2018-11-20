note
	description: "chess application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CHESS_BOARD

inherit
	ARGUMENTS

create
	make

feature
	empty : EMPTY           --  symbol .
	board : ARRAY2[PIECE]   --  array of figures uppercase for white lowercase for black
	cord : COORDINATES
	knight : KNIGHT         --  symbol 'N' or 'n'
	rook : ROOK				--  symbol 'R' or 'r'
	pawn : PAWN				--  symbol 'P' or 'p'
	king : KING				--  symbol 'K' or 'k'
	bishop : BISHOP			--  symbol 'B' or 'b'
	queen : QUEEN			--  symbol 'Q' or 'q'
	black1, black2, white1, white2, blackk, whitek, flg : BOOLEAN

feature
	init
		local
			i : INTEGER
			j : INTEGER
		do
			create cord.init(1, 1)
			create empty.init('.', cord.twin)
			create board.make_filled (empty, 100, 100)
			create rook.init('R', cord.twin)
			create knight.init('N', cord.twin)
			create bishop.init('B', cord.twin)
			create king.init('K', cord.twin)
			create queen.init('Q', cord.twin)
			create pawn.init('P', cord.twin)
			from i := 1 until i > 8 loop
				from j := 1 until j > 8 loop
					create cord.init (i, j)
					create empty.init ('.', cord.twin)
					if i.min (9 - i) + j.min (9 - j) = 2 then --rook
						if i = 1 then
							create rook.init('R', cord.twin)
						else
							create rook.init('r', cord.twin)
						end
						board[i, j] := rook.twin
					elseif i.min (9 - i) = 1 and j.min (9 - j) = 2 then --knight
						if i = 1 then
							create knight.init('N', cord.twin)
						else
							create knight.init('n', cord.twin)
						end
						board[i, j] := knight.twin
					elseif i.min (9 - i) = 1 and j.min (9 - j) = 3 then
						if i = 1 then
							create bishop.init('B', cord.twin)
						else
							create bishop.init('b', cord.twin)
						end
						board[i, j] := bishop.twin
					elseif i.min (9 - i) = 1 and j = 4 then
						if i = 1 then
							create king.init('K', cord.twin)
						else
							create king.init('k', cord.twin)
						end
						board[i, j] := king.twin
					elseif i.min (9 - i) = 1 and j = 5 then
						if i = 1 then
							create queen.init('Q', cord.twin)
						else
							create queen.init('q', cord.twin)
						end
						board[i, j] := queen.twin
					elseif i.min (9 - i) = 2 then
						if i = 2 then
							create pawn.init('P', cord.twin)
						else
							create pawn.init('p', cord.twin)
						end
						board[i, j] := pawn.twin
					else
						create empty.init ('.', cord.twin)
						board[i, j] := empty.twin
					end
					j := j + 1
				end
				i := i + 1
			end
		end

feature
	can_move (p1, p2 : COORDINATES) : BOOLEAN
		local
			ch : CHARACTER
			piece : PIECE
			cor1, cor2, help : COORDINATES
		do
			Result := false
			piece := board[p1.r, p1.c]
			ch := piece.colour.as_lower
			if ch = 'r' then
				if piece.can_move (p2) then
					Result := can_move_rook(p1, p2)
				end
			elseif ch = 'n' then
				if piece.can_move (p2) then
					Result := can_move_knight(p1, p2)
				end
			elseif ch = 'b' then
				if piece.can_move (p2) then
					Result := can_move_bishop(p1, p2)
				end
			elseif ch = 'k' then
				if piece.can_move (p2) then
					Result := can_move_king(p1, p2)
				end
			elseif ch = 'q' then
				if piece.can_move (p2) then
					Result := can_move_queen(p1, p2)
				end
			elseif ch = 'p' then
				if piece.can_move (p2) then
					Result := can_move_pawn(p1, p2)
				end
			end
			if Result = true then
				create help.init (100, 100)
				move(p2, help)
				move(p1, p2)
				if flg = true and is_check_to_white = true then
					Result := false
				end
				if flg = false and is_check_to_black = true then
					Result := false
				end
				move(p2, p1)
				move(help, p2)
			end
		end

feature
	can_attack_king (p1, p2 : COORDINATES) : BOOLEAN
		local
			ch : CHARACTER
			piece : PIECE
			cor1, cor2, help : COORDINATES
		do
			Result := false
			piece := board[p1.r, p1.c]
			ch := piece.colour.as_lower
			if ch = 'r' then
				if piece.can_move (p2) then
					Result := can_move_rook(p1, p2)
				end
			elseif ch = 'n' then
				if piece.can_move (p2) then
					Result := can_move_knight(p1, p2)
				end
			elseif ch = 'b' then
				if piece.can_move (p2) then
					Result := can_move_bishop(p1, p2)
				end
			elseif ch = 'q' then
				if piece.can_move (p2) then
					Result := can_move_queen(p1, p2)
				end
			elseif ch = 'k' then
				if piece.can_move (p2) then
					Result := can_move_king_without_castling(p1, p2)
				end
			elseif ch = 'p' then
				if piece.can_move (p2) then
					Result := can_move_pawn(p1, p2)
				end
			end
		end

feature
	equal_colour (p1, p2 : COORDINATES) : BOOLEAN
		local
			x1, x2 : BOOLEAN
		do
			Result := true
			x1 := board[p1.r, p1.c].colour.is_lower
			x2 := board[p2.r, p2.c].colour.is_lower
			if board[p2.r, p2.c].colour /= '.' then
				Result := x1 xor x2
			end
		end
feature
	can_move_rook (p1, p2 : COORDINATES) : BOOLEAN
		local
			i : INTEGER
		do
			Result := true
			if p1.r > p2.r then
				from i := p2.r + 1 until i = p1.r loop
					if board[i, p1.c].colour /= '.' then
						i := p1.r - 1
						Result := false
					end
					i := i + 1
				end
			elseif p1.r < p2.r then
				from i := p1.r + 1 until i = p2.r loop
					if board[i, p1.c].colour /= '.' then
						i := p2.r - 1
						Result := false
					end
					i := i + 1
				end
			elseif p1.c > p2.c then
				from i := p2.c + 1 until i = p1.c loop
					if board[p1.r, i].colour /= '.' then
						i := p1.c - 1
						Result := false
					end
					i := i + 1
				end
			else
				from i := p1.c + 1 until i = p2.c loop
					if board[p1.r, i].colour /= '.' then
						i := p2.c - 1
						Result := false
					end
					i := i + 1
				end
			end
			if Result = true then
				Result := equal_colour(p1, p2)
			end
		end

feature
	can_move_knight (p1, p2 : COORDINATES) : BOOLEAN
		do
			Result := equal_colour(p1, p2)
		end

feature
	can_move_bishop (p1, p2 : COORDINATES) : BOOLEAN
		local
			i : INTEGER
		do
			Result := true
			if p2.r > p1.r and p2.c > p1.c then
				from i := 1 until p1.r + i = p2.r loop
					if board[p1.r + i, p1.c + i].colour /= '.' then
						i := p2.r - p1.r - 1
						Result := false
					end
					i := i + 1
				end
			elseif p2.r < p1.r and p2.c < p1.c then
				from i := 1 until p1.r - i = p2.r loop
					if board[p1.r - i, p1.c - i].colour /= '.' then
						i := p1.r - p2.r - 1
						Result := false
					end
					i := i + 1
				end
			elseif p2.r > p1.r and p2.c < p1.c then
				from i := 1 until p1.r + i = p2.r loop
					if board[p1.r + i, p1.c - i].colour /= '.' then
						i := p2.r - p1.r - 1
						Result := false
					end
					i := i + 1
				end
			else
				from i := 1 until p1.r - i = p2.r loop
					if board[p1.r - i, p1.c + i].colour /= '.' then
						i := p1.r - p2.r - 1
						Result := false
					end
					i := i + 1
				end
			end
			if Result = true then
				Result := equal_colour(p1, p2)
			end
		end

feature
	can_move_queen (p1, p2 : COORDINATES) : BOOLEAN
		local
			bish : PIECE
		do
			create {BISHOP} bish.init ('B', p1)
			if bish.can_move (p2) then
				Result := can_move_bishop(p1, p2)
			else
				Result := can_move_rook(p1, p2)
			end
		end

feature
	can_move_king (p1, p2 : COORDINATES) : BOOLEAN
		local
			i, j : INTEGER
			flag : BOOLEAN
			cor1, cor2, cor3, corcur : COORDINATES
		do
			Result := false
			if p1.r = 1 and p1.c = 4 then
				if p2.r = 1 then
					create cor1.init (1, 4)
					if p2.c = 2 then
						create cor2.init (1, 3)
						create cor3.init (1, 2)
						flag := false
						from i := 1 until i > 8 or flag = true loop
							from j := 1 until j > 8 or flag = true loop
								if board[i, j].colour.is_lower then
									create corcur.init (i, j)
									if can_attack_king(corcur, cor1.twin) or
									   can_attack_king(corcur, cor2.twin) or
									   can_attack_king(corcur, cor3.twin) then
										flag := true
									end
								end
								j := j + 1
							end
							i := i + 1
						end
						if board[1, 3].colour /= '.' and board[1, 2].colour /= '.' then
							flag := true
						end
						if whitek = true or white1 = true then
							flag := true
						end
						Result := (not flag)
					elseif p2.c = 6 then
						create cor2.init (1, 5)
						create cor3.init (1, 6)
						flag := false
						from i := 1 until i > 8 or flag = true loop
							from j := 1 until j > 8 or flag = true loop
								if board[i, j].colour.is_lower then
									create corcur.init (i, j)
									if can_attack_king(corcur, cor1.twin) or
									   can_attack_king(corcur, cor2.twin) or
									   can_attack_king(corcur, cor3.twin) then
										flag := true
									end
								end
								j := j + 1
							end
							i := i + 1
						end
						if board[1, 5].colour /= '.' and board[1, 6].colour /= '.' then
							flag := true
						end
						if board[1, 7].colour /= '.' then
							flag := true
						end
						if whitek = true or white2 = true then
							flag := true
						end
						Result := (not flag)
					else
						Result := equal_colour(p1, p2)
					end
				else
					Result := equal_colour(p1, p2)
				end
			elseif p1.r = 8 and p1.c = 4 then
				if p2.r = 8 then
					create cor1.init (8, 4)
					if p2.c = 2 then
						create cor2.init (8, 3)
						create cor3.init (8, 2)
						flag := false
						from i := 1 until i > 8 or flag = true loop
							from j := 1 until j > 8 or flag = true loop
								if board[i, j].colour.is_upper then
									create corcur.init (i, j)
									if can_attack_king(corcur, cor1.twin) or
									   can_attack_king(corcur, cor2.twin) or
									   can_attack_king(corcur, cor3.twin) then
										flag := true
									end
								end
								j := j + 1
							end
							i := i + 1
						end
						if board[8, 3].colour /= '.' and board[8, 2].colour /= '.' then
							flag := true
						end
						if blackk = true or black1 = true then
							flag := true
						end
						Result := (not flag)
					elseif p2.c = 6 then
						create cor2.init (8, 5)
						create cor3.init (8, 6)
						flag := false
						from i := 1 until i > 8 or flag = true loop
							from j := 1 until j > 8 or flag = true loop
								if board[i, j].colour.is_upper then
									create corcur.init (i, j)
									if can_attack_king(corcur, cor1.twin) or
									   can_attack_king(corcur, cor2.twin) or
									   can_attack_king(corcur, cor3.twin) then
										flag := true
									end
								end
								j := j + 1
							end
							i := i + 1
						end
						if board[8, 5].colour /= '.' and board[8, 6].colour /= '.' then
							flag := true
						end
						if board[8, 7].colour /= '.' then
							flag := true
						end
						if blackk = true or black2 = true then
							flag := true
						end
						Result := (not flag)
					else
						Result := equal_colour(p1, p2)
					end
				else
					Result := equal_colour(p1, p2)
				end
			else
				Result := equal_colour(p1, p2)
			end
		end

feature
	can_move_pawn (p1, p2 : COORDINATES) : BOOLEAN
		local
			x1, x2 : BOOLEAN
		do
			Result := false
			if p1.c /= p2.c then
				x1 := board[p1.r, p1.c].colour.is_lower
				x2 := board[p2.r, p2.c].colour.is_lower
				if board[p2.r, p2.c].colour /= '.' then
					Result := x1 xor x2
				else
					Result := false
				end
			elseif (p1.r - p2.r).abs = 2 then
				Result := (board[(p1.r + p2.r) // 2, p1.c].colour = '.' and board[p2.r, p2.c].colour = '.')
			else
				Result := (board[p2.r, p2.c].colour = '.')
			end
		end

feature
	move (p1, p2 : COORDINATES)
		local
			coor, old_coor, cor, cr : COORDINATES
			new_empty, emp : EMPTY
			rok : ROOK
		do
			create coor.init (p2.r, p2.c)
			create old_coor.init (p1.r, p1.c)
			create new_empty.init ('.', old_coor.twin)
			if p1.r = 1 and p1.c = 4 then
				whitek := true
				if p2.r = 1 and p2.c = 2 then
					create cor.init (1, 3)
					create rok.init ('R', cor.twin)
					create cr.init (1, 1)
					create emp.init ('.', cr.twin)
					board[1, 3] := rok.twin
					board[1, 1] := emp.twin
				end
				if p2.r = 1 and p2.c = 6 then
					create cor.init (1, 5)
					create rok.init ('R', cor.twin)
					create cr.init (1, 8)
					create emp.init ('.', cr.twin)
					board[1, 5] := rok.twin
					board[1, 8] := emp.twin
				end
			end
			if p1.r = 1 and p1.c = 1 then
				white1 := true
			end
			if p1.r = 1 and p1.c = 8 then
				white2 := true
			end
			if p1.r = 8 and p1.c = 4 then
				blackk := true
				if p2.r = 8 and p2.c = 2 then
					create cor.init (8, 3)
					create rok.init ('r', cor.twin)
					create cr.init (8, 1)
					create emp.init ('.', cr.twin)
					board[8, 3] := rok.twin
					board[8, 1] := emp.twin
				end
				if p2.r = 8 and p2.c = 6 then
					create cor.init (8, 5)
					create rok.init ('r', cor.twin)
					create cr.init (8, 8)
					create emp.init ('.', cr.twin)
					board[8, 5] := rok.twin
					board[8, 8] := emp.twin
				end
			end
			if p1.r = 8 and p1.c = 1 then
				black1 := true
			end
			if p1.r = 8 and p1.c = 8 then
				black2 := true
			end
			board[p2.r, p2.c] := board[p1.r, p1.c].twin
			board[p2.r, p2.c].move (coor.twin)
			board[p1.r, p1.c] := new_empty.twin
		end

feature
	chess_board
		local
			i : INTEGER
			j : INTEGER
		do
			from i := 1 until i > 8 loop
				from j := 1 until j > 8 loop
					print (board[i, j].colour)
					j := j + 1
				end
				print("%N")
				i := i + 1
			end
			print("%N")
		end

feature
	is_check_to_black : BOOLEAN
		local
			i : INTEGER
			j : INTEGER
			kingx, kingy : INTEGER
			cor1, cor2 : COORDINATES
		do
			Result := false
			create cor1.init (0, 0)
			cor2 := find_black_king
			from i := 1 until i > 8 or Result = true loop
				from j := 1 until j > 8 or Result = true loop
					if board[i, j].colour /= '.' then
						if board[i, j].colour.is_upper then
							create cor1.init (i, j)
							if can_attack_king(cor1, cor2) then
								Result := true
							end
						end
					end
					j := j + 1
				end
				i := i + 1
			end
		end

feature
	can_move_king_without_castling (p1, p2 : COORDINATES) : BOOLEAN
		do
			Result := equal_colour(p1, p2)
		end

feature
	is_check_to_white : BOOLEAN
		local
			i : INTEGER
			j : INTEGER
			kingx, kingy : INTEGER
			cor1, cor2 : COORDINATES
		do
			Result := false
			create cor1.init (0, 0)
			cor2 := find_white_king
			from i := 1 until i > 8 loop
				from j := 1 until j > 8 loop
					if board[i, j].colour /= '.' then
						if board[i, j].colour.is_lower then
							create cor1.init (i, j)
							if can_attack_king(cor1, cor2) then
								Result := true
							end
						end
					end
					j := j + 1
				end
				i := i + 1
			end
		end

feature
	is_checkmate_to_black : BOOLEAN
		local
			i, j, k, l : INTEGER
			cor1, cor2, help : COORDINATES
		do
			Result := false
			create help.init (100, 100)
			if is_check_to_black then
				Result := true
				from i := 1 until i > 8 or Result = false loop
					from j := 1 until j > 8 or Result = false loop
						from k := 1 until k > 8 or Result = false loop
							from l := 1 until l > 8 or Result = false loop
								create cor1.init (i, j)
								create cor2.init (k, l)
								if board[i, j].colour.is_lower then
									if can_move(cor1, cor2) then
										move (cor2, help)
										move (cor1, cor2)
										if not is_check_to_black then
											Result := false
										end
										move (cor2, cor1)
										move (help, cor2)
									end
								end
								l := l + 1
							end
							k := k + 1
						end
						j := j + 1
					end
					i := i + 1
				end
			end
		end

feature
	is_checkmate_to_white : BOOLEAN
		local
			i, j, k, l : INTEGER
			cor1, cor2, help : COORDINATES
		do
			Result := false
			create help.init (100, 100)
			if is_check_to_white then
				Result := true
				from i := 1 until i > 8 or Result = false loop
					from j := 1 until j > 8 or Result = false loop
						from k := 1 until k > 8 or Result = false loop
							from l := 1 until l > 8 or Result = false loop
								create cor1.init (i, j)
								create cor2.init (k, l)
								if board[i, j].colour.is_upper then
									if can_move(cor1, cor2) then
										move (cor2, help)
										move (cor1, cor2)
										if not is_check_to_white then
											Result := false
										end
										move (cor2, cor1)
										move (help, cor2)
									end
								end
								l := l + 1
							end
							k := k + 1
						end
						j := j + 1
					end
					i := i + 1
				end
			end
		end

feature
	find_black_king : COORDINATES
		local
			i, j, kingx, kingy : INTEGER
			cor : COORDINATES
		do
			create cor.init (0, 0)
			from i := 1 until i > 8 loop
				from j := 1 until j > 8 loop
					if board[i, j].colour = 'k' then
						kingx := i
						kingy := j
					end
					j := j + 1
				end
				i := i + 1
			end
			create cor.init (kingx, kingy)
			Result := cor
		end

feature
	find_white_king : COORDINATES
		local
			i, j, kingx, kingy : INTEGER
			cor : COORDINATES
		do
			create cor.init (0, 0)
			from i := 1 until i > 8 loop
				from j := 1 until j > 8 loop
					if board[i, j].colour = 'K' then
						kingx := i
						kingy := j
					end
					j := j + 1
				end
				i := i + 1
			end
			create cor.init (kingx, kingy)
			Result := cor
		end

feature
	pawn_promotion
		local
			j : INTEGER
			flag : BOOLEAN
			transformee : PIECE
			cor : COORDINATES
		do
			from j := 1 until j > 8 loop
				if board[1, j].colour = 'p' then
					create cor.init (1, j)
					choose_figure
					if io.last_integer = 1 then
						create {QUEEN} transformee.init ('q', cor.twin)
					elseif io.last_integer = 2 then
						create {ROOK} transformee.init ('r', cor.twin)
					elseif io.last_integer = 3 then
						create {BISHOP} transformee.init ('b', cor.twin)
					else
						create {KNIGHT} transformee.init ('n', cor.twin)
					end
					board[1, j] := transformee.twin
					print("%N")
					chess_board
				elseif board[8, j].colour = 'P' then
					create cor.init (8, j)
					choose_figure
					if io.last_integer = 1 then
						create {QUEEN} transformee.init ('Q', cor.twin)
					elseif io.last_integer = 2 then
						create {ROOK} transformee.init ('R', cor.twin)
					elseif io.last_integer = 3 then
						create {BISHOP} transformee.init ('B', cor.twin)
					else
						create {KNIGHT} transformee.init ('N', cor.twin)
					end
					board[8, j] := transformee.twin
					print("%N")
					chess_board
				end
				j := j + 1
			end
		end

feature
	choose_figure
		local
			flag : BOOLEAN
		do
			print("Choose the figure to transform%N")
			print("1 - Queen%N")
			print("2 - Rook%N")
			print("3 - Bishop%N")
			print("4 - Knight%N")
			from flag := false until flag = true loop
				io.read_integer
				flag := true
				if io.last_integer > 4 or io.last_integer < 1 then
					flag := false
					print("Invalid number%N%N")
					print("Choose the figure to transform%N")
					print("1 - Queen%N")
					print("2 - Rook%N")
					print("3 - Bishop%N")
					print("4 - Knight%N")
				end
			end
		end

feature {NONE}
	make
		local
			i : INTEGER
			coor1, coor2 : COORDINATES
			win : BOOLEAN
			c1x, c1y, c2x, c2y : INTEGER
			help1, help2 : BOOLEAN
		do
			win := false
			init
			chess_board --start position
			from flg := true until win = true loop
				if flg = true then
					print("White's move:%N")
				else
					print("Black's move:%N")
				end
				io.read_integer
				c1x := io.last_integer
				io.read_integer
				c1y := io.last_integer
				io.read_integer
				c2x := io.last_integer
				io.read_integer
				c2y := io.last_integer
				create coor1.init (c1x, c1y)
				create coor2.init (c2x, c2y)
				if can_move(coor1, coor2) then
					help1 := board[c1x, c1y].colour.is_upper
					if help1 xor flg = false then
						move(coor1, coor2)
						flg := flg xor true
						chess_board
					else
						print("invalid move%N")
					end
				else
					print("invalid move%N")
				end
				pawn_promotion
				if is_checkmate_to_black then
					print("WHITE WINS")
					win := true
				elseif is_checkmate_to_white then
					print("BLACK WINS")
					win := true
				end
				print("%N")
			end
		end
end
