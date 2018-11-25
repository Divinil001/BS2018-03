note
	description: "Summary description for {EMPTY_PIECE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EMPTY_PIECE

inherit
	CHESS_PIECE

create
	make_empty

feature
	make_empty
		do
			figure:='.'
			fig_color:=0
			create array.make_empty
		end

end
