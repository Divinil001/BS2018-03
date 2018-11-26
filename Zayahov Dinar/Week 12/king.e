note
	description: "Summary description for {KING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KING
inherit
	PIECE
create
	make

feature
	name: STRING
		once
			Result:="K"
		end

	can_move(x,y: INTEGER): BOOLEAN
		do
			if
				x<=8 and y<=8 and x>=1 and y>=1 and (position_of_piece[1]-x).power (2).power (0.5)<=1 and (position_of_piece[2]-y).power(2).power(0.5)<=1
			then
				Result:=True
			else
				Result:=False
			end
		end

end
