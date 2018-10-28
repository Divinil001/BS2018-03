class
	GAME

create
	make

feature{NONE}
	players: LINKED_LIST[PLAYER]
	board: BOARD
	a: APPLICATION
	game_over: BOOLEAN
	random_sequence: RANDOM
	turns_number: INTEGER

	roll_dice: INTEGER
	do
		random_sequence.forth
		Result := random_sequence.item \\ 6 + 1
	ensure
		Result >= 1
		Result <= 6
	end

	y_o_n(q: STRING): BOOLEAN
  	local
  		correct: BOOLEAN
  	do
		from
			correct := false
		until
			correct
		loop
			io.put_string (q + " [Y/n] >> ")
			io.read_line
			io.last_string.to_lower
			correct := io.last_string ~ "y" or io.last_string ~ "n"
			Result := io.last_string ~ "y"
		end
  	end

	init_players(players_number: INTEGER)
	local
		i: INTEGER
		name: STRING
	do
		create players.make
		a.system("cls")
		from
			i := 1
		until
			i > players_number
		loop
			print("Player " + i.out + ", enter your name >> ")
			io.read_line
			name := io.last_string.out
			players.extend (create {PLAYER}.make (i, name))
			i := i + 1
			a.system("cls")
		end
	end

	start_game
	do
		a.system ("cls")
		players.start
		from
		until
			game_over
		loop
			make_turn
		end
		print("The game is over!")
	end

	make_turn
	local
		dice0, dice1: INTEGER
	do
		a.system ("cls")
		print(players.item.name + ", your turn!%NYour money: " + players.item.money.out + "K RUB%N")

		if players.item.in_jail ~ 0 then
			move
		else
			if y_o_n("Do you want to pay a fine (50K RUB)?") then
				players.item.add_jail (- players.item.in_jail)
				move
			else
				dice0 := roll_dice
				dice1 := roll_dice
				if dice0 ~ dice1 then
					players.item.add_jail (- players.item.in_jail)
					print("WOW! You got " + dice0.out + " " + dice1.out + " on dices. So you go out of the jail!%N")
					move2(dice0, dice1)
				else
					print("Sorry, but your dices are " + dice0.out + " " + dice1.out + "%N. Try on the next turn.%N")
					players.item.add_jail (-1)
				end
			end
		end
		check_current_player
		if players.islast then
			players.start
		else
			players.forth
		end
		turns_number := turns_number + 1
		check_game
		if not game_over then
			print("Please press ENTER to end your turn.%N")
			io.read_line
		end
	end

	move
	local
		cell_number0, cell_number1: INTEGER
		cell: GAME_CELL
	do
		cell_number0 := roll_dice
		cell_number1 := roll_dice
		if players.item.current_position + cell_number0 + cell_number1 > 20 then
			players.item.add_money (200)
			print("You got 200, because you've reached the go cell!%N")
		end
		players.item.add_position (cell_number0 + cell_number1)
		--print(players.item.current_position)
		cell := board.cells.at (players.item.current_position)
		cell.pay (players.item)
	end

	move2(dice0, dice1: INTEGER)
	local
		cell: GAME_CELL
	do
		if players.item.current_position + dice0 + dice1 > 20 then
			players.item.add_money (200)
			print("You got 200, because you've reached the go cell!%N")
		end
		players.item.add_position (dice0 + dice1)
		cell := board.cells.at (players.item.current_position)
		cell.pay (players.item)
	end

	check_game
	do
		game_over := turns_number > 100 or players.count = 1
	end

	check_current_player
	do
		if players.item.money < 0 then
			players.remove
			players.back
		end
	end

	get_winners: ARRAYED_LIST[INTEGER]
	do
		create Result.make(0)
	end


feature
	make(a_n: APPLICATION players_number: INTEGER)
	require
		players_number > 1
	do
		a := a_n
		create random_sequence.set_seed ((create {TIME}.make_now).compact_time)
		create board.make
		init_players(players_number)
		start_game
	end
end
