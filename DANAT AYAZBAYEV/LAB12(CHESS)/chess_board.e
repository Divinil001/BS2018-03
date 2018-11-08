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

feature
	init
		local
			i : INTEGER
			j : INTEGER
		do
			create cord.init(1, 1)
			create empty.init('.', cord)
			create board.make_filled (empty, 8, 8)
			create rook.init('R', cord)
			create knight.init('N', cord)
			create bishop.init('B', cord)
			create king.init('K', cord)
			create queen.init('Q', cord)
			create pawn.init('P', cord)
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
				from i := p2.r until i = p1.r loop
					if board[i, p1.c].colour /= '.' then
						i := p1.r - 1
						Result := false
					end
					i := i + 1
				end
			elseif p1.r < p2.r then
				from i := p1.r until i = p2.r loop
					if board[i, p1.c].colour /= '.' then
						i := p2.r - 1
						Result := false
					end
					i := i + 1
				end
			elseif p1.c > p2.c then
				from i := p2.c until i = p1.c loop
					if board[p1.r, i].colour /= '.' then
						i := p1.c - 1
						Result := false
					end
					i := i + 1
				end
			else
				from i := p1.c until i = p2.c loop
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
		do
			Result := false
			if can_move_bishop(p1, p2) and can_move_rook(p1, p2) then
				Result := true
			end
		end

feature
	can_move_king (p1, p2 : COORDINATES) : BOOLEAN
		do
			Result := equal_colour(p1, p2)
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
		require
			can_move_from_p1_to_p2 : can_move(p1, p2) = true
		local
			coor, old_coor : COORDINATES
			new_empty : EMPTY
		do
			create coor.init (p2.r, p2.c)
			create old_coor.init (p1.r, p1.c)
			create empty.init ('.', old_coor)
			board[p2.r, p2.c] := board[p1.r, p1.c].twin
			board[p2.r, p2.c].move (coor)
			board[p1.r, p1.c] := empty
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

feature {NONE}
	make
		local
			i : INTEGER
			coor1, coor2 : COORDINATES
		do
			init
			chess_board --start position
			create coor1.init (2, 4)
			create coor2.init (4, 4)
			move(coor1, coor2)   --1.e4
			chess_board
			create coor1.init (7, 4)
			create coor2.init (5, 4)
			move(coor1, coor2)   --1 .. e5
			chess_board
			create coor1.init (1, 2)
			create coor2.init (3, 3)
			move(coor1, coor2)   --2.Nf3
			chess_board
			create coor1.init (8, 7)
			create coor2.init (6, 6)
			move(coor1, coor2)    --2 .. Nc6
			chess_board
			create coor1.init (1, 3)
			create coor2.init (5, 7)
			move(coor1, coor2)    --3.Bb5
			chess_board
			create coor1.init (7, 8)
			create coor2.init (6, 8)
			move(coor1, coor2)     --3 .. a6
			chess_board
			create coor1.init (5, 7)
			create coor2.init (6, 6)
			move(coor1, coor2)   --4.Bc6
			chess_board
			create coor1.init (7, 5)
			create coor2.init (6, 6)
			move(coor1, coor2)   --4 .. dc
			chess_board
			create coor1.init (2, 5)
			create coor2.init (4, 5)
			move(coor1, coor2)   --5.d4
			chess_board
			create coor1.init (8, 6)
			create coor2.init (4, 2)
			move(coor1, coor2)    --5 .. Bg4
			chess_board
			create coor1.init (2, 1)
			create coor2.init (3, 1)
			move(coor1, coor2)    --6.h3
			chess_board
			create coor1.init (7, 1)
			create coor2.init (5, 1)
			move(coor1, coor2)     --6 .. h5
			chess_board
		end

end
