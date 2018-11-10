note
	description: "Summary description for {KING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KING

inherit
	CHESS_PIECE
		redefine
			can_move
		end

create
	create_king

feature
	create_king(color:INTEGER)
		do
			create array.make_empty
			array.force('K', 1) --capital K is white king
			array.force('k', 2) --small one is black king
			figure:=array.at (color)
			fig_color:=color
		end

	can_move(new_x, new_y:INTEGER):BOOLEAN
		require else
			new_x<= 8 and new_x > 0
			new_y<= 8 and new_y > 0
		do
			Result:= ((new_x = current.x + 1 or new_x = x) and (new_y = y or new_y = y + 1 or new_y = y - 1)) or ((new_x = current.x - 1 or new_x = new_x) and (new_y = y or new_y = y + 1 or new_y = y - 1))
		end

end
