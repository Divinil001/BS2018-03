note
	description: "Summary description for {PAWN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAWN
inherit
	PIECE
create
	make

feature
	name: STRING
		once
			Result:="P"
		end

	can_move(x,y: INTEGER): BOOLEAN
		do
			if
				y/=2 and Current.colour~"BLACK"
			then
				if
					x<=8 and y<=8 and x>=1 and y>=1 and position_of_piece[2]-y=1 and position_of_piece[1]-x=0
				then
					Result:=True
				else
					Result:=False
				end
			elseif
				y=2 and Current.colour~"BLACK"
			then
				if
					x<=8 and y<=8 and x>=1 and y>=1 and ( (position_of_piece[2]-y=1 and position_of_piece[1]-x=0) or (position_of_piece[2]-y=2 and position_of_piece[1]-x=0) )
				then
					Result:=True
				else
					Result:=False
				end
			elseif
				y/=7 and Current.colour~"WHITE"
			then
				if
					x<=8 and y<=8 and x>=1 and y>=1 and position_of_piece[2]-y=-1 and position_of_piece[1]-x=0
				then
					Result:=True
				else
					Result:=False
				end
			elseif
				y=7 and Current.colour~"WHITE"
			then
				if
					x<=8 and y<=8 and x>=1 and y>=1 and ( (position_of_piece[2]-y=-1 and position_of_piece[1]-x=0) or (position_of_piece[2]-y=-2 and position_of_piece[1]-x=0) )
				then
					Result:=True
				else
					Result:=False
				end
			end
		end

end
