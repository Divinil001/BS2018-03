class
	BOARD

create
	make

feature

	move (old_pos, new_pos: TUPLE [x: INTEGER; y: INTEGER])
		do
			if attached board [old_pos.x, old_pos.y] as f then
				f.move (new_pos)
			else
				print ("There is no piece!%N")
			end
		end

feature

	white, black: ARRAYED_LIST [PIECE]

	board: ARRAY2 [detachable PIECE]

	make
		do
			create board.make_filled (VOID, 8, 8)
			create white.make (0)
			create black.make (0)
			white.extend (create {PAWN}.make ([1, 2], false, board))
			white.extend (create {PAWN}.make ([2, 2], false, board))
			white.extend (create {PAWN}.make ([3, 2], false, board))
			white.extend (create {PAWN}.make ([4, 2], false, board))
			white.extend (create {PAWN}.make ([5, 2], false, board))
			white.extend (create {PAWN}.make ([6, 2], false, board))
			white.extend (create {PAWN}.make ([7, 2], false, board))
			white.extend (create {PAWN}.make ([8, 2], false, board))
			white.extend (create {ROOK}.make ([1, 1], false, board))
			white.extend (create {KNIGHT}.make ([2, 1], false, board))
			white.extend (create {BISHOP}.make ([3, 1], false, board))
			white.extend (create {KING}.make ([4, 1], false, board))
			white.extend (create {QUEEN}.make ([5, 1], false, board))
			white.extend (create {BISHOP}.make ([6, 1], false, board))
			white.extend (create {KNIGHT}.make ([7, 1], false, board))
			white.extend (create {ROOK}.make ([8, 1], false, board))
			board [1, 2] := white [1]
			board [2, 2] := white [2]
			board [3, 2] := white [3]
			board [4, 2] := white [4]
			board [5, 2] := white [5]
			board [6, 2] := white [6]
			board [7, 2] := white [7]
			board [8, 2] := white [8]
			board [1, 1] := white [9]
			board [2, 1] := white [10]
			board [3, 1] := white [11]
			board [4, 1] := white [12]
			board [5, 1] := white [13]
			board [6, 1] := white [14]
			board [7, 1] := white [15]
			board [8, 1] := white [16]
			black.extend (create {PAWN}.make ([1, 7], true, board))
			black.extend (create {PAWN}.make ([2, 7], true, board))
			black.extend (create {PAWN}.make ([3, 7], true, board))
			black.extend (create {PAWN}.make ([4, 7], true, board))
			black.extend (create {PAWN}.make ([5, 7], true, board))
			black.extend (create {PAWN}.make ([6, 7], true, board))
			black.extend (create {PAWN}.make ([7, 7], true, board))
			black.extend (create {PAWN}.make ([8, 7], true, board))
			black.extend (create {KNIGHT}.make ([2, 8], true, board))
			black.extend (create {BISHOP}.make ([3, 8], true, board))
			black.extend (create {KING}.make ([4, 8], true, board))
			black.extend (create {QUEEN}.make ([5, 8], true, board))
			black.extend (create {BISHOP}.make ([6, 8], true, board))
			black.extend (create {KNIGHT}.make ([7, 8], true, board))
			black.extend (create {ROOK}.make ([8, 8], true, board))
			board [1, 7] := black [1]
			board [2, 7] := black [2]
			board [3, 7] := black [3]
			board [4, 7] := black [4]
			board [5, 7] := black [5]
			board [6, 7] := black [6]
			board [7, 7] := black [7]
			board [8, 7] := black [8]
			board [2, 8] := black [9]
			board [3, 8] := black [10]
			board [4, 8] := black [11]
			board [5, 8] := black [12]
			board [6, 8] := black [13]
			board [7, 8] := black [14]
			board [8, 8] := black [15]
		end

end
