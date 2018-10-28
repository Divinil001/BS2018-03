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

feature {NONE} -- Initialization
	g: GAME
	i: INTEGER
	make
			-- Run application.
		do
			create g.make
			g.start
			from
				i := 1
			until
				i = 101
			loop
				g.round
				g.check_for_winner
				i := i + 1
			end
			g.check_for_winner
			print("%N" + g.winner.name + " won.%N")
		end

end
