note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature
	dice1 : INTEGER --Current number on dice1
	dice2 : INTEGER --Current number on dice2

	random_sequence : RANDOM  --Helping to generate random numbers
	two : INTEGER_64 = 2000000000 --Constant

	pl : INTEGER   --Index of current player
	pl_num : INTEGER   --Number of players left
	pl_name : ARRAYED_LIST[STRING]  --Name of every player
	pl_money : ARRAYED_LIST[INTEGER]  --Money of every player	
	pl_pos : ARRAYED_LIST[INTEGER]   --Current position of every player

	pl_jail : ARRAYED_LIST[INTEGER]
	--If i-th element positive, i-th player is in jail,
	--and is trying to throw double in three moves, and pl_jail[i] is how many attempts left
	--before paying fine and going out of prison.

	pl_fine : ARRAYED_LIST[INTEGER]
	--If i-th player was in jail, and when he landed on the jail, if he decided to go out immediately
	--from the jail by paying 50K rubles for the next two moves, pl_fine[i] is how much
	--moves left to end paying, for example when pl_fine[i] is 1, in the next move player
	--should pay 50K to the bank.

	is_prop : ARRAYED_LIST[BOOLEAN] --Is there a property on i-th position

	owned_by : ARRAYED_LIST[STRING] --By whom every property is owned currently

	rent : ARRAYED_LIST[INTEGER] --Rent prices of properties

	buy : ARRAYED_LIST[INTEGER] --Buy prices of properties

	prop_name : ARRAYED_LIST[STRING]  --Names of properties

feature
	randinit
		local
		    l_time: TIME
		    l_seed: INTEGER
	    do
	     	create l_time.make_now
	        l_seed := l_time.hour
	        l_seed := l_seed * 60 + l_time.minute
	        l_seed := l_seed * 60 + l_time.second
	        l_seed := l_seed * 1000 + l_time.milli_second
	        create random_sequence.set_seed (l_seed)
	    end
	rand : INTEGER
		do
			random_sequence.forth
			Result := random_sequence.item
		end

feature
	init
		local
			i : INTEGER
			j : INTEGER
		do
			from until pl_num > 0 loop
				print("Please, enter the number of players from 2 to 6%N")
				io.read_integer
				print("%N")
				if io.last_integer < 2 or io.last_integer > 6 then
					print("Incorrect number of players!%N")
				else
					pl_num := io.last_integer
				end
			end

			--Initialize players
			create pl_name.make(0)
			create pl_money.make(0)
			create pl_pos.make(0)
			create pl_jail.make(0)
			create pl_fine.make(0)
			from i := 1 until i > pl_num loop
				print("Player number " + i.out + ", please enter your nickname for this game%N")
				io.read_line
				print("%N")
				j := 1
				from until j = i or j < 1 loop
					if pl_name[j] ~ io.last_string.out then
						j := -5
					end
					j := j + 1
				end
				if j < 1 then
					i := i - 1
					print("Please, don't repeat other players' nicknames!%N")
				else
					pl_name.extend(io.last_string.out)
					pl_money.extend(1500000)
					pl_pos.extend(1)
					pl_jail.extend(0)
					pl_fine.extend(0)
				end
				i := i + 1
			end

			--Initialize property
			create is_prop.make_filled(20)
			create owned_by.make(0)
			create rent.make_filled(20)
			create buy.make_filled(20)
			create prop_name.make(0)
			from i := 1 until i > 20 loop
				owned_by.extend ("Nobody")
				prop_name.extend ("")
				i := i + 1
			end
			is_prop[2] := true
			is_prop[3] := true
			is_prop[5] := true
			is_prop[7] := true
			is_prop[8] := true
			is_prop[10] := true
			is_prop[12] := true
			is_prop[14] := true
			is_prop[15] := true
			is_prop[17] := true
			is_prop[18] := true
			is_prop[20] := true

			rent[2] := 2000
			rent[3] := 4000
			rent[5] := 4000
			rent[7] := 6000
			rent[8] := 8000
			rent[10] := 12000
			rent[12] := 18000
			rent[14] := 22000
			rent[15] := 22000
			rent[17] := 28000
			rent[18] := 35000
			rent[20] := 50000

			buy[2] := 60000
			buy[3] := 60000
			buy[5] := 80000
			buy[7] := 100000
			buy[8] := 120000
			buy[10] := 160000
			buy[12] := 220000
			buy[14] := 260000
			buy[15] := 280000
			buy[17] := 320000
			buy[18] := 360000
			buy[20] := 400000

			prop_name[2] := "Christ the Redeemer"
			prop_name[3] := "Luang Pho To"
			prop_name[5] := "Alyosha monument"
			prop_name[7] := "Tokyo Wan Kannon"
			prop_name[8] := "Luangpho Yai"
			prop_name[10] := "The Motherland"
			prop_name[12] := "Awaji Kannon"
			prop_name[14] := "Rodina-Mat Zovyot!"
			prop_name[15] := "Great Buddha of Thailand"
			prop_name[17] := "Laykyun Setkyar"
			prop_name[18] := "Spring Temple Buddha"
			prop_name[20] := "Statue of Unity"
		end

feature
	winner
		local
			i : INTEGER
			mx : INTEGER
			win : INTEGER  --Number of winners
		do
			from i := 1 until i > pl_num loop
				mx := mx.max (pl_money[i])
				i := i + 1
			end
			print("%NGAME ENDED!%NCONGRATULATIONS TO:%N")
			from i := 1 until i > pl_num loop
				if pl_money[i] = mx then
					win := win + 1
					print(pl_name[i] + "%N")
				end
				i := i + 1
			end
			print("%NYOU ARE WINNER")
			if win > 1 then
				print("S")
			end
			print("!")
		end

feature
	kick (ind : INTEGER)
		local
			i : INTEGER
		do
			print(pl_name[ind] + " went bankrupt!%NBetter luck next time!%N%N")
			from i := 1 until i > 20 loop
				if owned_by[i] ~ pl_name[ind] then
					owned_by[i] := "Nobody"
				end
				i := i + 1
			end
			from i := ind until i = pl_num loop
				pl_money[i] := pl_money[i + 1]
				pl_fine[i] := pl_fine[i + 1]
				pl_jail[i] := pl_jail[i + 1]
				pl_pos[i] := pl_pos[i + 1]
				pl_name[i] := pl_name[i + 1]
				i := i + 1
			end
			pl_num := pl_num - 1
			pl := pl - 1
		end

feature
	play
		local
			round : INTEGER
		do
			from round := 1 until round > 100 or pl_num = 1 loop
				print("%NROUND " + round.out + "%N")
				from pl := 1 until pl > pl_num or pl_num = 1 loop
					if pl_fine[pl] > 0 and pl_money[pl] < 50000 then
						kick(pl)
					else
						roll_dice(pl)
						make_turn(pl)
					end
					if pl < pl_num then
						print("%NPress Enter to roll dice for " + pl_name[pl + 1] + "%N")
						io.read_line
					end
					pl := pl + 1
				end
				if pl_num > 1 or round < 100 then
					print("%NPress Enter to play next round%N")
					io.read_line
				end
				round := round + 1
			end
		end

feature
	roll_dice (ind : INTEGER)
		do
			if pl_fine[ind] > 0 then
				print(pl_name[ind] + " payed 50000 RUBLES")
				print(" as fine before move. ")
				pl_money[ind] := pl_money[ind] - 50000
				pl_fine[ind] := pl_fine[ind] - 1
				print("Money left: " + pl_money[ind].out + "%N%N")
			end
			print("Rolling dice for " + pl_name[ind] + "...%N")
			randinit
			dice1 := rand \\ 4 + 1
			randinit
			dice2 := rand \\ 4 + 1
			sleep(two)
		end

feature
	make_turn (ind : INTEGER)
		do
			if pl_jail[ind] > 1 then
				if dice1 = dice2 then
					pl_jail[ind] := 0
					move(ind)
				else
					if pl_jail[ind] = 1 then
						if pl_money[ind] < 50000 then
							kick(ind)
						else
							print(pl_name[ind] + " payed 50000 RUBLES")
							print(" as fine before going out from jail. ")
							pl_money[ind] := pl_money[ind] - 50000
							print("Money left: " + pl_money[ind].out + "%N%N")
						end
					else
						pl_jail[ind] := pl_jail[ind] - 1
					end
				end
			else
				move(ind)
			end
		end

feature
	move (ind : INTEGER)
		do
			pl_pos[ind] := pl_pos[ind] + dice1 + dice2
			if pl_pos[ind] > 20 then
				pl_money[ind] := pl_money[ind] + 200000
			end
			pl_pos[ind] := pl_pos[ind] \\ 20
			if pl_pos[ind] = 0 then
				pl_pos[ind] := 1
			end
			effect(ind)
		end

feature
	effect (ind : INTEGER)
		local
			i : INTEGER
			x : INTEGER
		do
			if pl_pos[ind] = 4 then
				print(pl_name[ind] + " landed on TAX and payed ")
				print(pl_money[ind] // 10)
				print(" RUBLES    ")
				pl_money[ind] := pl_money[ind] * 9 // 10
				pl_money[ind] := pl_money[ind] // 10 * 10
				print("Money left: " + pl_money[ind].out + "%N%N")
				--INCOME TAX PAY 10 PERCENT

			elseif pl_pos[ind] = 9 or pl_pos[ind] = 13 or pl_pos[ind] = 19 then
				print(pl_name[ind] + " landed on CHANCE and ")
				randinit
				x := rand \\ 50001
				x := x * 10 - 200000
				if x < 0 then
					print("lost " + (-x).out + " RUBLES")
				else
					print("gained " + x.out + " RUBLES")
				end
				pl_money[ind] := pl_money[ind] + x
				if pl_money[ind] < 0 then
					kick(ind)
				else
					print("   Money left: " + pl_money[ind].out + " RUBLES%N%N")
				end
				--CHANCE

			elseif pl_pos[ind] = 16 then
				print(pl_name[ind] + " landed on JAIL%N")
				from until i > 0 loop
					i := 1
					print("Decide how to get out from the jail:%N")
					print("Type 1 to try throwing doubles%N")
					print("Type 2 to pay fine next two moves%N")
					io.read_integer
					print("%N")
					if io.last_integer = 1 then
						pl_jail[ind] := 3
					elseif io.last_integer = 2 then
						pl_fine[ind] := 2
					else
						i := 0
						print("Type 1 or 2!%N")
					end
				end
				--IN JAIL

			elseif is_prop[pl_pos[ind]] then
				if owned_by[pl_pos[ind]] ~ "Nobody" then
					print(pl_name[ind] + " landed on property " + prop_name[pl_pos[ind]] + "%N")
					if pl_money[ind] < buy[pl_pos[ind]] then
						print(pl_name[ind] + " does nothing due to lack of money%N%N")
					else
						from until i > 0 loop
							i := 1
							print("Decide what to do with property:%N")
							print("Type 1 to buy property (" + buy[pl_pos[ind]].out + " RUBLES)   ")
							print("Your cash: " + pl_money[ind].out + "%N")
							print("Type 2 to do nothing%N")
							io.read_integer
							print("%N")
							if io.last_integer = 1 then
								pl_money[ind] := pl_money[ind] - buy[pl_pos[ind]]
								owned_by[pl_pos[ind]] := pl_name[ind]
								print("   Money left: " + pl_money[ind].out + " RUBLES%N%N")
							elseif io.last_integer = 2 then
								--NOTHING
							else
								i := 0
								print("Type 1 or 2!%N")
							end
						end
					end
				else
					if owned_by[pl_pos[ind]] ~ pl_name[ind] then
						print("Nothing interesting...")
						print("   Money left: " + pl_money[ind].out + " RUBLES%N%N")
					else
						from i := 1 until i > pl_num or i < 1 loop
							if owned_by[pl_pos[ind]] ~ pl_name[i] then
								print(pl_name[ind] + " payed " + rent[pl_pos[ind]].out)
								print(" RUBLES as the rent to " + pl_name[i])
								pl_money[ind] := pl_money[ind] - rent[pl_pos[ind]]
								pl_money[i] := pl_money[i] + rent[pl_pos[ind]]
								if pl_money[ind] < 0 then
									kick(ind)
								else
									print("   Money left: " + pl_money[ind].out + " RUBLES%N%N")
								end
								i := -5
							end
							i := i + 1
						end
					end
				end
				--LANDED ON PROPERTY

			else
				print("Nothing interesting...")
				print("   Money left: " + pl_money[ind].out + " RUBLES%N%N")
				--NOTHING

			end
		end

feature {NONE}
	make
		do
			randinit
			init
			print("Press Enter to start the game%N")
			io.read_line
			play
			winner
		end

end
