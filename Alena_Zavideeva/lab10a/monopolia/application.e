class
	APPLICATION

create
	make

feature
	players: ARRAY[PLAYER]
	board: ARRAY[SQUARD]
	round: INTEGER
	make

		do
			create players.make_empty
			create board.make_empty
			fill_board_with_squards
			Io.put_string ("The board has initializated successfully %N")
			registration_players
			Io.put_string ("Players have signed in successfully %N")

			from
				round := 1
			until
				round > 100 or players.count = 1
			loop
				turns_of_players
				round := round + 1
			end
		end

feature -- Random

    rand() : integer
        -- Returns random number from 0 to 2^32
        external
            "C inline use <stdlib.h>"
        alias
            "return rand();"
        end

feature
	registration_players
		local
			n, i : INTEGER
			player: PLAYER
		do
			Io.put_string ("Amount of players: ")
			Io.read_integer
			n := Io.last_integer

			from
				i := 1
			until
				i > n
			loop
				Io.put_string ("Write your name: ")
				Io.read_line
				create player.make (Io.last_string.out)
				players.force (player, i)
				i := i + 1
			end

		end

	fill_board_with_squards

		do
			board.force (create {GO}.make ("Squard: Go", 1), 1)
			board.force (create {LAND}.make ("Property: Christ the Redeemer", 2, 60, 2), 2)
			board.force (create {LAND}.make ("Property: Luang Pho To", 3, 60, 4), 3)
			board.force (create {TAX}.make ("INCOME TAX PAY MONEY",4),4)
			board.force (create {LAND}.make ("Property: Alyosha monument", 5, 80, 4), 5)
			board.force (create {IN_JAIL}.make ("IN JAIL", 6),6)
			board.force (create {LAND}.make ("Property: Tokyo Wan Kannon", 7, 100, 6), 7)
			board.force (create {LAND}.make ("Property: Luangpho Yai", 8, 120, 8), 8)
			board.force (create {CHANCE}.make ("Chance?",9),9)
			board.force (create {LAND}.make ("Property: The Motherland", 10, 160, 12), 10)
			board.force (create {FREE_PARKING}.make ("Free parking", 11),11)
			board.force (create {LAND}.make ("Property: Awaji Kannon", 12, 220, 18), 12)
			board.force (create {CHANCE}.make ("Chance?", 13),13)
			board.force (create {LAND}.make ("Property: Rodina-Mat Zovyot", 14, 260, 22), 14)
			board.force (create {LAND}.make ("Property: Great Buddha of Thailand", 15, 280, 22), 15)
			board.force (create {GO_TO_JAIL}.make ("Go to jail", 16),16)
			board.force (create {LAND}.make ("Property: Laykyun Setkyar", 17, 320, 28), 17)
			board.force (create {LAND}.make ("Property: Spring Temple Buddha", 18, 360, 35), 18)
			board.force (create {CHANCE}.make ("Chance?",19),19)
			board.force (create {LAND}.make ("Property: Statue of Unity", 20, 400, 50), 20)
		end
feature
	turns_of_players
		local
			i, dice1, dice2, k : INTEGER
		do
			from
				i := 1
			until
				i > players.count
			loop
				Io.put_string ("Turn for player: " + players[i].get_name + "%N")
				dice1 := rand \\ 6
				dice2 := rand \\ 6
				if dice1 = dice2 and dice1 = 0 then

					k := (12 + players[i].get_position - 1) \\ 20 + 1
					if k = 0 then
						k := 1
					end
					players[i].change_position (k)
				elseif dice1 = 0 then
					k := (6 + dice2 + players[i].get_position - 1) \\ 20 + 1
					if k = 0 then
						k := 1
					end
					players[i].change_position (k)
				end
				i := i + 1
			end
		end
end
