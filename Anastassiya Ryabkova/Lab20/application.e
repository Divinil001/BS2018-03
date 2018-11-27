note
	description: "chess application root class"
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
			-- Run application.
		local
			game:CHESS_BOARD
		do
			create game.make
			print("%N------------------------------%N")
		end

end
