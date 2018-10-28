note
	description: "Summary description for {MONOPOLY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MONOPOLY

create
	make

feature

	players: ARRAYED_LIST [PLAYER]

	current_player_index: INTEGER

	field: FIELD

	counter: INTEGER

	make
		do
			create players.make (0)
			current_player_index := 0
			create field.make
			counter := 0
		end

	add_player (p: PLAYER)
		do
				--		players.extend(p)
			players.put_front (p)
			counter := counter + 100
		end

	make_turn (player: PLAYER)
		local
			dice: INTEGER
			pos: INTEGER
			first_roll, second_roll: INTEGER
		do
			dice := roll_dice
			if player.in_jail > 0 then
				print ("Player ")
				print (current_player_index)
				print ("'s turn. You have ")
				print (player.balance)
				print ("K. You are in jail. Would you like to pay your fine? Otherwise, you will roll 2 dices. If they match, you proceed forward by the rolled number on cells.")
				print ("You have ")
				print (player.in_jail)
				print (" more roll attempts.%N")
				io.read_line
				io.last_string.to_lower
				if io.last_string ~ "yes" then
					print ("Paying 50K...%N")
					player.change_balance (-50)
				else
					print ("You declined. OK. Rolling the dices...%N")
					first_roll := roll_dice
					second_roll := roll_dice
					print ("Results are ")
					print (first_roll)
					print (" and ")
					print (second_roll)
					print (". ")
					if first_roll = second_roll then
						print ("Yay! Lucky you! You are going out of jail!%N")
						player.go_out_of_jail
						move_player (player, first_roll)
					else
						print ("Ouch! You attempt to flee the jail have failed.%N")
						player.decr_in_jail
						if player.in_jail = 0 then
							print ("Paying 50K...")
							player.change_balance (-50)
						end
					end
				end
			else
				print ("Player ")
				print (current_player_index)
				print ("'s turn. You have ")
				print (player.balance)
				print ("K. Dice roll result is ")
				print (dice)
				print (".%N")
				move_player (player, dice)
			end
			print ("You have ")
			print (player.balance)
			print ("K.%N")
			if player.balance < 0 then
				print ("You have negative balance, so you leave the game. Bye!!!%N")
				player.lose
			end
		end

	move_player (player: PLAYER amount: INTEGER)
		local
			pos: INTEGER
		do
			pos := player.position + amount
			if pos > field.cells.count then
				pos := pos - field.cells.count
				player.change_balance (200)
			end
			player.set_pos (pos)
			field.cells [pos].step (player)
			player.update
		end

	roll_dice: INTEGER
		local
			r: RANDOM
			l_time: TIME
			l_seed: INTEGER
		do
			create l_time.make_now
			l_seed := l_time.hour
			l_seed := l_seed * 60 + l_time.minute
			l_seed := l_seed * 60 + l_time.second
			l_seed := l_seed * 1000 + l_time.milli_second
			create r.set_seed (l_seed)
			r.start
			r.forth
			Result := r.item \\ 4 + 1
		end

	remove_player (p: PLAYER)
		do
			players.start
			players.prune (p)
		end

	run
		local
			i: INTEGER
			player: PLAYER
			winner_index, winner_balance: INTEGER
		do
			winner_index := -1
			winner_balance := -1
			from
				i := players.count
			until
				counter = 0
			loop
				current_player_index := players.count - i + 1
				make_turn (players [i])
				i := i - 1
				if i < 1 then
					i := i + players.count
				end
				counter := counter - 1

				if players.count = 1 then
					counter := 0
				end
			end
			print ("Looks like game came to the end. Player statistics:%N")
			from
				i := players.count
			until
				i = 0
			loop
				player := players [i]
				print ("Player ")
				print (players.count - i + 1)
				print (": ")
				print (player.balance)
				print ("%N")
				if player.balance > winner_balance then
					winner_balance := player.balance
					winner_index := i
				end

				i := i - 1
			end
		end

end
