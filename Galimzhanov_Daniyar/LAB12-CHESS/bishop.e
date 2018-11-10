note
	description: "Summary description for {BISHOP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BISHOP

inherit
	CHESS_PIECE
		redefine
			can_move
		end

create
	create_bishop

feature
	create_bishop(color:INTEGER)
		do
			create array.make_empty
			array.force('B', 1)
			array.force('b', 2)
			figure := array.at(color)
			fig_color:=color
		end

	can_move(new_x, new_y:INTEGER):BOOLEAN
		require else
			new_x<= 8 and new_x > 0
			new_y<= 8 and new_y > 0
		do
			Result:= ((new_y - y).abs = (new_x - x).abs)
		end

end
