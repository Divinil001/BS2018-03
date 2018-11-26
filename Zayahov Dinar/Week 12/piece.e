note
	description: "Summary description for {PIECE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PIECE

feature

	colour_of_piece: STRING assign set_colour

	position_of_piece: ARRAYED_LIST [INTEGER]



feature

	make (c: STRING; x, y: INTEGER)
		do
			create position_of_piece.make (2)
			colour_of_piece := c
			position_of_piece [1] := x
			position_of_piece [2] := y
		end

	name: STRING
		deferred
		end

	colour: STRING
		do
			Result := colour_of_piece
		end

	position: ARRAYED_LIST [INTEGER]
		do
			Result := position_of_piece
		end

	can_move (x, y: INTEGER): BOOLEAN
		deferred
		end

	move(x,y: INTEGER)
		do
			if
				Current.can_move (x,y)=True
			then
				Current.set_position (x,y)
			else
				print("This piece can not go to this position.")
			end
		end

	set_colour (c: STRING)
		do
			colour_of_piece := c
		end

	set_position (x, y: INTEGER)
		do
			position_of_piece [1] := x
			position_of_piece [2] := y
		end

end
