note
	description: "connect_four application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			area: AREA
			player1: PLAYER
			player2: PLAYER
			color1: INTEGER
			color2: INTEGER
			stop: BOOLEAN
			i: INTEGER
			-- Run application.
		do
			print("Color1: ")
			io.read_integer
			color1 := io.last_integer
			print("Color2: ")
			io.read_integer
			color2 := io.last_integer
			create player1.fill_in("PLAYER1", color1)
			create player2.fill_in("PLAYER2", color2)
			create area.fill_in (6, 6)
			from
				stop := FALSE
				i := 0
			until stop = TRUE loop
				if i \\ 2 = 0 then
					area.turn (player1)
				else
					area.turn (player2)
				end
				stop := area.end_game_check
				if stop then
					area.printf
					if i \\ 2 = 0 then
						print(player1.name)
					else
						print(player2.name)
					end
				end
				i := i + 1
			end
		end

end
