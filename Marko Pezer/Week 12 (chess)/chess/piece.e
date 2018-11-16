note
	description: "Summary description for {PIECE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PIECE

feature

	color: BOOLEAN
	position_x: INTEGER
	position_y: INTEGER

	can_move (x, y: INTEGER; chess_field: CHESS_TABLE)
	do
	end

	set_color (c: BOOLEAN)
	do
		color := c
	end

	set_position_x (x: INTEGER)
	do
		position_x := x
	end

	set_position_y (y: INTEGER)
	do
		position_y := y
	end

end
