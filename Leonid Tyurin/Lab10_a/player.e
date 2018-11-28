note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature

	name: STRING

	random: RANDOM

	board: BOARD

	balance, position, in_jail, dice1, dice2: INTEGER

	make (new_name: STRING; new_board: BOARD)
		local
			l_seed: INTEGER
			l_time: TIME
		do
			create l_time.make_now
			l_seed := l_time.hour
			l_seed := l_seed * 60 + l_time.minute
			l_seed := l_seed * 60 + l_time.second
			l_seed := l_seed * 1000 + l_time.milli_second
			create random.set_seed (l_seed + new_name.hash_code)
			name := new_name
			board := new_board
			balance := 1000
			position := 1
			in_jail := 0
		end

	pay (payment: INTEGER)
		do
			balance := balance - payment
			if payment < 0 then
				print ("Got " + (- payment).out + "K%N")
			elseif payment > 0 then
				print ("Payed " + payment.out + "K%N")
			end
			print ("Your balance is: " + balance.out + "K%N")
		end

	go_to_jail
		do
			position := board.jail.position
			in_jail := 3
		end

	decrease_in_jail (value: INTEGER)
		do
			in_jail := value
		end

	go
		do
			if balance > 0 then
				print ("Turn of the player '" + name + "'%NYour balance: " + balance.out + "K%N")
				dice1 := random.item \\ 6 + 1
				random.forth
				dice2 := random.item \\ 6 + 1
				random.forth
				if in_jail > 0 then
					board.jail.make_action (Current)
				end
				print ("Rolled " + dice1.out + " and " + dice2.out + "%N")
				if in_jail = 0 then
					if position + dice1 + dice2 > board.size then
						board.start.make_action (Current)
					end
					position := (position + dice1 + dice2 - 1) \\ (board.size) + 1
					print ("Moved to <" + board.get (position).description + ">%N")
					board.get (position).make_action (Current)
				end
				if balance < 0 then
					print ("You lost%N")
				end
				print ("%N")
			end
		end

end
