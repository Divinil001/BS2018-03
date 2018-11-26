note
	description: "Summary description for {CELLS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELLS
create
	make
feature
	piece: detachable PIECE
	name: STRING

feature
	make(n: STRING)
		do
			name:=n
		end

	set_name(n: STRING)
		do
			name:=n
		end

end
