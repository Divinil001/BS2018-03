note
	description: "Monopoly application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			players_number: INTEGER
			g: GAME
		do
			print("Welcom to Monopoly game!%NDeveloped by Artem Bahanov%N%NPlease enter the number of players >> ")
			io.read_integer
			players_number := io.last_integer
			create g.make (Current, players_number)
		end

end
