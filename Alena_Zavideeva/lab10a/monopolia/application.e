class
	APPLICATION

create
	make

feature
	players: ARRAY[PLAYER]
	board: ARRAY[SQUARD]
	round: INTEGER
	tmp : INTEGER
	winners: ARRAY[PLAYER]
	max, p :INTEGER
--	time: TIME
	make

		do
	--		create time.make_now
			create players.make_empty
			create board.make_empty
			create winners.make_empty
			fill_board_with_squards
			Io.put_string ("The board has initializated successfully %N")
			registration_players
			Io.put_string ("Players have signed in successfully %N%N")
			tmp := 0
			from
				round := 1
			until
				round > 100 or players.count = 1
			loop
				turns_of_players
				round := round + 1
			end
			max := 0
			if round = 100 then
				from
					p := 1
				until
					p > players.count
				loop
					if max < players[p].get_money then
						max := players[p].get_money
					end
					p := p + 1
				end

				from
					p := 1
				until
					p > players.count
				loop
					if
						max = players[p].get_money
					then
						winners.force(players[p], winners.count + 1)
					end
					p := p + 1
				end
			else
				winners.force(players[1], 1)
			end

			if
				winners.count = 1
			then
				Io.put_string ("Congratulations! There is only one winner of Monopoly: " + winners[1].get_name)
			else
				Io.put_string ("Congratulations! There are not only one winner of Monopoly: %N")
				from
					p := 1
				until
					p > winners.count
				loop
					Io.put_string (winners[p].get_name + "%N")
					p := p + 1
				end
			end
		end

feature -- Random
	  time(): integer
        -- Returns the current time
        external
            "C inline use <time.h>"
        alias
            "return (int)time(0);"
        end
    rand : integer
        -- Returns random number from 0 to 2^32
        external
            "C inline use <stdlib.h>"
        alias
            "return rand();"
        end

    srand(seed : INTEGER)
        -- Initializes random sequence
        external
            "C inline use <stdlib.h>"
        alias
            "srand($seed);"
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
		local
			go : SQUARD

		do
			create {GO}go.make ("Go", 1)
			board.force (go, 1)
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
			i, pos: INTEGER
			--Go: GO
		do
			from
				i := 1
			until
				i > players.count
			loop
				tmp := tmp + 1
				Io.put_string ("Turn for player: " + players[i].get_name + "%N")
				Io.put_string ("Your amount of money: " + players[i].get_money.out + "%N")
				Io.put_string ("Status: on squard " + board[players[i].get_position].name + "%N")
				if players[i].in_jail = True then
					Io.put_string(players[i].get_name + " is not free%N")
					board[6].action (players[i])
					if players[i].in_jail = False then
						Io.put_string(players[i].get_name +" is on squard: " + board[players[i].get_position].name + "%N")
						pos := players[i].get_position
						board[pos].action (players[i])
					end
				else
					players[i].change_position(changing_pos_after_turn(players[i]))
					Io.put_string(players[i].get_name +" is on squard: " + board[players[i].get_position].name + "%N")
					pos := players[i].get_position
					board[pos].action (players[i])
				end
				if players[i].alive = False then
					Io.put_string (players[i].get_name + " leaves the game%N")
					remove_player(players[i])
				end
				i := i + 1
				Io.putstring ("_____________________________________%N")
			end
		end

	changing_pos_after_turn(player: PLAYER): INTEGER
		local
			dice1, dice2, k : INTEGER
		do
			Io.put_string(player.get_name +" is throwing dice" + "%N")
			srand(time+tmp)
			dice1 := rand \\ 6
			dice2 := rand \\ 6
			if dice1 = 0 then
				dice1 := 6
			end
			if
				dice2 = 0
			then
				dice2 := 6
			end

			Io.put_string ("The dice are " + dice1.out + " " + dice2.out + "%N")
			k := (dice1 + dice2 + player.get_position - 1) \\ 20 + 1
			if k = 0 then
				k := 1
			end
			Result := k
		end
	remove_player(player: PLAYER)
		local
			new_players: ARRAY[PLAYER]
			i : INTEGER
		do
			create new_players.make_empty
			from
				i := 1
			until
				i > players.count
			loop
				if player /= players[i] then
					new_players.force (players[i],new_players.count + 1)
				end
				i := i + 1
			end
			players := new_players
		end
end
