note
	description: "Summary description for {PAWN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAWN

inherit
	PIECE

redefine
	can_move
end

create
	make

feature

	make (c: BOOLEAN; x: INTEGER; y: INTEGER)
	require
		x_position_good: x >= 1 and x <= 8
		y_position_good: y >= 1 and y <= 8
	do
		set_color (c)
		set_position_x (x)
		set_position_y (y)
	end

	can_move (x, y: INTEGER; chess_field: CHESS_TABLE)
	do
		if x < 1 or x > 8 or y < 1 or y > 8 then
			io.put_string ("Mistake! Position out of table! %N%N")
		else
			if color = True then -- White pawn
				if y = position_y and x = position_x - 1 and (chess_field.table.item(x, y) /= 1) then
					io.put_string ("You successfully moved white pawn from " + position_x.out + "," + position_y.out + " to " + x.out + "," + y.out + "!%N%N")
					chess_field.table.put (0, position_x, position_y)
					position_x := x
					position_y := y
					chess_field.table.put (1, position_x, position_y)
				else
					io.put_string ("Impossible move!%N%N")
				end
			else -- Black pawn
				if y = position_y and x = position_x + 1 and (chess_field.table.item(x, y) /= 2) then
					io.put_string ("You successfully moved black pawn from " + position_x.out + "," + position_y.out + " to " + x.out + "," + y.out + "!%N%N")
					chess_field.table.put (0, position_x, position_y)
					position_x := x
					position_y := y
					chess_field.table.put (2, position_x, position_y)
				else
					io.put_string ("Impossible move!%N%N")
				end
			end
		end
	end

end
