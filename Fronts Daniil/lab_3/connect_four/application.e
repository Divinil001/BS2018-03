note
	description: "connect_four application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	n: INTEGER
	m : INTEGER
	map : MAP
	player_1 : PLAYER
	player_2 : PLAYER
	winner_1 : BOOLEAN
	winner_2 : BOOLEAN
	coords : ARRAY[INTEGER]
	make
			-- Run application.
		do
			print("N:")
			io.read_integer
			n := io.last_integer
			print("%NM:")
			io.read_integer
			m := io.last_integer
			print("%N")
			create map.make(n, m)
			create player_1.make(1, map)
			create player_2.make(2, map)
			create coords.make_empty
			map.printable
			from
				winner_1 := False
				winner_2 := False
			until
				winner_1 = True or winner_2 = True
			loop
				coords := player_1.turn
				winner_1 := map.check_winner(coords[1], coords[2], player_1.player_num)
				if winner_1 /= True then
					coords := player_2.turn
					winner_2 := map.check_winner(coords[1], coords[2], player_2.player_num)
				end
			end
			print("%N")
			if winner_1 = True then
				print("CONGTATULATIONS TO PLAYER_1")
			else
				print("CONGRATULATIONS TO PLAYER_2")
			end
		end

end
