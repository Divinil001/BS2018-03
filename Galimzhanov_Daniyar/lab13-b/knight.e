note
	description: "Summary description for {KNIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KNIGHT

inherit
	CHESS_PIECE
		redefine
			can_move
		end

create
	create_knight

feature
	create_knight(color:INTEGER)
		do
			create array.make_empty
			array.force('H', 1)
			array.force('h', 2)
			figure := array.at(color)
			fig_color:=color
		end

	can_move(new_x, new_y:INTEGER):BOOLEAN
		require else
			new_x<= 8 and new_x > 0
			new_y<= 8 and new_y > 0
		do
			Result := (new_x = x + 2 and (new_y = y + 1 or new_y = y - 1)) or (new_x = x - 2 and (new_y = y + 1 or new_y = y - 1)) or (new_y = y + 2 and (new_x = x + 1 or new_x = x - 1)) or (new_y = y - 2 and (new_x = x + 1 or new_x = x - 1))
		end

end
