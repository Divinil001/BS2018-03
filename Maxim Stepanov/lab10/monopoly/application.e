note
	description: "monopoly application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature

	make
		local
			game: MONOPOLY
			player1, player2, player3: PLAYER
		do
			print (">>> Fresh Monopoly start <<<%N")
			create game.make
			create player1.make (game)
			create player2.make (game)
			create player3.make (game)
			game.add_player (player1)
			game.add_player (player2)
			game.add_player (player3)
			game.run
		end

end
