note
	description: "Summary description for {QUEEN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUEEN

inherit
	CHESS_PIECE
		redefine
			can_move
		end

create
	create_queen


feature
	create_queen(color:INTEGER)
		do
			create array.make_empty
			array.force('Q', 1)
			array.force('q', 2)
			figure:=array.at(color)
			fig_color:=color
		end

	can_move(new_x, new_y:INTEGER):BOOLEAN
		require else
			new_x<= 8 and new_x > 0
			new_y<= 8 and new_y > 0
		do
			Result:= ((new_y - y).abs = (new_x - x).abs) or (new_y = y xor new_x = x)
		end
end
