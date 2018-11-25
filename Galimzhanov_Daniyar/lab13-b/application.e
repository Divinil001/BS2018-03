note
	description: "project_test application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	board:BOARD


feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here

			create board.create_board("Greg", "Oleg")
			--board.show_board
			--board.move_pawn

			board.game

		end

end
