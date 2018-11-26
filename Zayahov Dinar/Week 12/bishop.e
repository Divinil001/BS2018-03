note
	description: "Summary description for {BISHOP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BISHOP
inherit
	PIECE
create
	make

feature
	name: STRING
		once
			Result:="B"
		end

	can_move(x,y: INTEGER): BOOLEAN
		do
			if
				x<=8 and y<=8 and x>=1 and y>=1 and (position_of_piece[1]-x).power (2).power (0.5)=(position_of_piece[1]-y).power(2).power(0.5)
			then
				Result:=True
			else
				Result:=False
			end
		end

end
