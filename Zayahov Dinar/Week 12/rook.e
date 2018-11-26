note
	description: "Summary description for {ROOK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ROOK
inherit
	PIECE
create
	make

feature
	name: STRING
		once
			Result:="R"
		end

	can_move(x,y: INTEGER): BOOLEAN
		do
			if
				x<=8 and y<=8 and x>=1 and y>=1 and ( (position_of_piece[1]-x=0) or (position_of_piece[2]-y=0) )
			then
				Result:=True
			else
				Result:=False
			end
		end

end
