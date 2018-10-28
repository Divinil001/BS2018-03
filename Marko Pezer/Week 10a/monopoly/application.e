note
	description: "Monopoly Application"
	author: "Marko Pezer"
	date: "23.10.2018"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	s1, s6, s11: FREE_SQUARE
	s4: INCOME_TAX_SQUARE
	s9, s13, s19: CHANCE_SQUARE
	s16: GO_TO_JAIL_SQUARE
	s2, s3, s5, s7, s8, s10, s12, s14, s15, s17, s18, s20: PROPERTY_SQUARE
	bank: PERSON
	num, pleft, i, j: INTEGER
	table: ARRAY[SQUARE]
	p1, p2, p3, p4, p5, p6: PERSON
	players: ARRAY[PERSON]
	winner, numw, mon: INTEGER
	random_sequence: RANDOM
	game: GAME_FUNCTIONS
	tmp: INTEGER

	make
	local
		a,b: INTEGER
	do
		initialization_of_game

		----------------------------------------------------

		----------------------------------------------------

		-- Input number of players and their names

		io.put_string ("Input number of players (2-6): ")
		io.read_integer
		num := io.last_integer.twin
		pleft := num

		from i := 1
		until i > num
		loop
			io.put_string ("Input Player " + i.out + " name: ")
			io.read_line
			players[i].set_name (io.last_string.twin)
			i := i + 1
		end
		io.put_new_line

		-- Game simulation

		io.put_string ("------------------------------------------%N%N")
		from i := 1
		until i > 100 or pleft <= 1
		loop

			from j := 1
			until j > num
			loop
				if (players[j].loser = False) and pleft > 1  then

					io.put_string (players[j].name + "'s move!%N")
					players[j].print_info

					a := get_throw
					b := get_throw

					if players[j].days_in_jail > 0 then

						game.player_in_jail (players[j], a, b)

						if players[j].days_in_jail = 0 then

							io.put_string ("You get: " + a.out + ", " + b.out + "%N")

							tmp := players[j].position.twin
							players[j].set_position (game.move (players[j].position, a + b))

							if tmp > players[j].position then
								io.put_string ("You pass throught Start square, so you got 200000 RUB. %N%N")
							end

							table[players[j].position].player_on_square (players[j])
						end
					else

						io.put_string ("You get: " + a.out + ", " + b.out + "%N")

						tmp := players[j].position.twin
						players[j].set_position (game.move (players[j].position, a + b))

						if tmp > players[j].position then
							io.put_string ("%NYou pass throught Start square, so you got 200000 RUB. %N")
						end

						table[players[j].position].player_on_square (players[j])
					end

					if players[j].loser = False then
						players[j].print_info
					end

					io.put_string ("Press ENTER to go to next move...")
					io.read_line

					io.put_string ("%N------------------------------------------%N%N")
					j := j + 1

				end
			end
			i := i + 1
		end

		-- Find winner(s)

		winner := 0
		numw := 0

		from i := 1
		until i > num
		loop
			if players[i].loser = False then
				winner := i
				numw := numw + 1
			end
			i := i + 1
		end

		-- Print who is winner

		if numw = 0 then
			io.put_string ("Game is finished! There is no winner.%N")
		elseif numw = 1 then
			io.put_string ("Game is finished! Winner is " + players[winner].name + ".%N")
		else
			winner := 0
			mon := 0

			-- Find who is winner if there is more than one player left after 100 rounds

			from i := 1
			until i > num
			loop
				if players[i].loser = False and players[i].money >= mon then
					winner := i
					mon := players[i].money
					numw := numw + 1
				end
				i := i + 1
			end

			io.put_string ("Game is finished after 100 rounds! Winner is " + players[winner].name + ".%N")
		end

	end

	-- Generate random number from 1 to 6

  	get_throw: INTEGER
    do
    	random_sequence.forth
    	Result := random_sequence.item \\ 6 + 1
   	ensure
    	Result > 0
    end

    -- Initialization of the game

	initialization_of_game
	do
		create game

		-- Initialize random sequence

		create random_sequence.set_seed ((create {TIME}.make_now).compact_time)

		-- Create players

		create p1.make (1, "")
		create p2.make (2, "")
		create p3.make (3, "")
		create p4.make (4, "")
		create p5.make (5, "")
		create p6.make (6, "")

		create players.make_filled (p1, 1, 6)
		players.put (p1, 1)
		players.put (p2, 2)
		players.put (p3, 3)
		players.put (p4, 4)
		players.put (p5, 5)
		players.put (p6, 6)

		-- Create table

		create bank.make (0, "Bank")

		create s1.make ("Go", 1)
		create s2.make ("Christ the Redeemer", 2, 60, 2, bank)
		create s3.make ("Luang Pho To", 3, 60, 4, bank)
		create s4.make ("Income tax", 4)
		create s5.make ("Alyosha monument", 5, 80, 4, bank)
		create s6.make ("In jail", 6)
		create s7.make ("Tokyo Wan Kannon", 7, 100, 6, bank)
		create s8.make ("Luangpho Yai", 8, 120, 8, bank)
		create s9.make ("Chance", 9)
		create s10.make ("The Motherland", 10, 160, 12, bank)
		create s11.make ("Free parking", 11)
		create s12.make ("Awaji Kannon", 12, 220, 18, bank)
		create s13.make ("Chance", 13)
		create s14.make ("Rodina-Mat' Zovyot!", 14, 260, 22, bank)
		create s15.make ("Great Buddha of Thailand", 15, 280, 22, bank)
		create s16.make ("Go to jail", 16)
		create s17.make ("Laykyun Setkyar", 17, 320, 28, bank)
		create s18.make ("Spring Temple Buddha", 18, 360, 35, bank)
		create s19.make ("Chance", 19)
		create s20.make ("Statue of Unity", 20, 400, 50, bank)

		create table.make_filled (s1, 1, 20)
		table.put (s1, 1)
		table.put (s2, 2)
		table.put (s3, 3)
		table.put (s4, 4)
		table.put (s5, 5)
		table.put (s6, 6)
		table.put (s7, 7)
		table.put (s8, 8)
		table.put (s9, 9)
		table.put (s10, 10)
		table.put (s11, 11)
		table.put (s12, 12)
		table.put (s13, 13)
		table.put (s14, 14)
		table.put (s15, 15)
		table.put (s16, 16)
		table.put (s17, 17)
		table.put (s18, 18)
		table.put (s19, 19)
		table.put (s20, 20)

	end

end
