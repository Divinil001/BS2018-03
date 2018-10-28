note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

create
	make

feature
	players: ARRAY[PLAYER]
	rounds : INTEGER
	number_of_players: INTEGER
	r: RANDOM
	t: TIME
	ended: BOOLEAN
	game_map: MAP
	winner : PLAYER
	make
	do
		ended := False
		create game_map.make
		create t.make_now
	    create r.set_seed (t.compact_time) -- ... is the initial "seed"
	    r.start
		rounds := 1
		create players.make_empty
		create winner.make("nobody")
	end

	start
	local
		tmp: PLAYER
		i: INTEGER
	do
		print("Write numbers of players: ")
		from number_of_players := 0 until number_of_players < 7 and number_of_players > 1 loop
			io.read_integer
			number_of_players := io.last_integer
		end
		from
			i := 1
		until
			i = number_of_players + 1
		loop
			print("%NWrite name of player " + i.out + ": ")
			io.read_line
			create tmp.make (io.last_string.string)
			players.force (tmp, i)
			i := i + 1
		end
	end

	round
	local
		i: INTEGER
	do
		from
			i := 1
		until
			i = number_of_players + 1
		loop
			print("%NRound: " + rounds.out + "%N")
			player_move(players[i])
			i := i + 1
		end
		rounds := rounds + 1
	end

	rand(q: INTEGER): INTEGER
	do
	    Result := r.item \\ q + 1
	    r.forth
	end

	player_move(p: PLAYER)
	local
		f_dice: INTEGER
		s_dice: INTEGER
		next_ind: INTEGER
		next_square: SQUARE
		nobody: PLAYER
		i: INTEGER
		tmp_square: SQUARE
		proper: PROPERTY
	do
		create nobody.make ("nobody")
		if not p.is_bankrupt then
			print("%NPress any key to move.%N")
			io.read_character
			f_dice := rand(6)
			s_dice := rand(6)
			if p.in_jail and p.hodok > 0 then
				p.butilka(f_dice, s_dice)
			end
			if not p.in_jail then
				if p.square_ind + f_dice + s_dice > 20 then
					p.change_money (200)
				end
				next_ind := (p.square_ind + f_dice + s_dice) \\ 21
				if next_ind = 0 then
					next_ind := 1
				end
				next_square := game_map.squares[next_ind]
				print("%N" + p.name + " got " + (f_dice + s_dice).out + "%N")
				print("%N" + p.name + " turn. He moves to " + next_ind.out + ".%N")
				p.balance
				print(next_square.info)
				next_square.action (p)
				p.balance
				p.change_square_ind(next_ind)
				if p.money < 0 then
					p.make_bankrupt
					number_of_players := number_of_players - 1
					from
						i := 1
					until
						i = game_map.squares.count + 1
					loop
						if attached {PROPERTY}game_map.squares[i] as pr then
							proper := pr
							proper.set_owner(nobody)
						end
						i := i + 1
					end
				end
			end
		end
	end

	check_for_winner
	local
		i: INTEGER
		max_money: INTEGER
		maybe_winner: PLAYER
	do
		max_money := players[1].money
		maybe_winner := players[1]
		if number_of_players = 1 then
			from
				i := 1
			until
				i = players.count + 1
			loop
				if not players[i].is_bankrupt then
					winner := players[i]
					ended := True
				end
				i := i + 1
			end
		elseif rounds = 101 then
			from
				i := 2
			until
				i = players.count + 1
			loop
				if players[i].money > max_money then
					maybe_winner := players[i]
					max_money := maybe_winner.money
				end
				i := i + 1
			end
			winner := maybe_winner
			ended := True
		end
	end

end
