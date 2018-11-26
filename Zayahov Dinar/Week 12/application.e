note
	description: "CHESS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			b: CHESS_BOARD
			-- Run application.
		do
			--| Add your code here
			create b.make
			b.chess_board
		end

end
