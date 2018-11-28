class
	QUEEN

inherit

	PIECE

create
	make

feature

	can_move (new_pos: TUPLE [x: INTEGER; y: INTEGER]): BOOLEAN
		local
			rook, bishop: PIECE
		do
			create {BISHOP} bishop.make (get_coord, get_color, board)
			create {ROOK} rook.make (get_coord, get_color, board)
			Result := bishop.can_move (new_pos) or else rook.can_move (new_pos)
		end

end
