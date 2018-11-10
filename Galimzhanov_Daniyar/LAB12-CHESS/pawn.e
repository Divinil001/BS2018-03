note
	description: "Summary description for {PAWN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAWN

inherit
	CHESS_PIECE
		redefine
			can_move
		end
create
	create_pawn

feature
	create_pawn(color:INTEGER)
		do
			create array.make_empty
			array.force ('1', 1) -- 1 is white
			array.force ('2', 2) -- 2 is black
			figure:=array[color]
			fig_color:=color
		end

	can_move(a_x:INTEGER; a_y:INTEGER):BOOLEAN
		do

			if fig_color = 1 then
				if x = 2 then
					if ((a_x=x+1 or a_x=x+2) and x <= 8 and a_y = y) or (a_x=x+1 and x <= 8 and(a_y = y + 1 or a_y = y - 1)) then

						Result:=True
					else
						Result:=False
					end
				else
					if (a_x=x+1 and x <= 8 and a_y = y) or (a_x = x + 1 and a_y = y + 1 or a_y = y - 1)then

						Result:=True
					else
						Result:=False
					end
				end
			else
				if x = 7 then
					if ((a_x=x-1 or a_x=x-2) and x > 0 and a_y = y) or (a_x = x - 1 and (a_y = y + 1 or a_y = y - 1) and x > 0) then

						Result:=True
					else
						Result:=False
					end
				else
					if (a_x=x-1 and x > 0 and a_y = y) or (a_x = x - 1 and a_y = y + 1 or a_y = y - 1) then

						Result:=True
					else
						Result:=False
					end
				end
			end
		end


end
