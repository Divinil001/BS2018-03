note
	description: "Summary description for {KNIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KNIGHT
inherit
	PIECE
create
	make

feature
	name: STRING
		once
			Result:="k"
		end

	can_move(x,y: INTEGER): BOOLEAN
		do
			if
				x<=8 and y<=8 and x>=1 and y>=1 and ( ((position_of_piece[1]-x).power(2).power(0.5)=1 and (position_of_piece[2]-y).power(2).power(0.5)=2) or ((position_of_piece[1]-x).power(2).power(0.5)=2 and (position_of_piece[2]-y).power(2).power(0.5)=1) )
			then
				Result:=True
			else
				Result:=False
			end
		end

end
