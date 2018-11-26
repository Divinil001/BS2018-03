note
	description: "Summary description for {QUEEN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUEEN
inherit
	PIECE
create
	make

feature
	name: STRING
		once
			Result:="Q"
		end
		
	can_move(x,y: INTEGER): BOOLEAN
		do
			if
				x<=8 and y<=8 and x>=1 and y>=1 and ( (position_of_piece[1]-x=0) or (position_of_piece[2]-y=0) or ((position_of_piece[1]-x).power (2).power (0.5)=(position_of_piece[1]-y).power(2).power(0.5)) )
			then
				Result:=True
			else
				Result:=False
			end
		end

end
