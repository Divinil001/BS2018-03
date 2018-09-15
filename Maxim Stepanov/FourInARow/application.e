note
	description: "FourInARow application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	make
		local
			game: GAME
			player1: PLAYER
			player2: PLAYER
		do
			create player1.make ("Player 1", "1")
			create player2.make ("Player 2", "2")

			create game.make(8, player1, player2)
			game.run
		end

end
