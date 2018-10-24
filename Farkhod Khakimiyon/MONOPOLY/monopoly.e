class
	MONOPOLY

create
	make

feature
	players: INTEGER
	a: ARRAY[STRING]
	price: ARRAY[INTEGER]
	rent: ARRAY[INTEGER]
	player: ARRAY[PLAYER]
	id: ARRAY[INTEGER]
	ex: PLAYER
	i: INTEGER
	j: INTEGER
	left: INTEGER
	rand: RANDOM
	make(num_players: INTEGER)
	require
		num_players <= 6
		num_players >= 2
	do
		create rand.set_seed(1237)
		players := num_players
		create ex.make(0)
		create a.make_filled("", 1, 20)
		create price.make_filled (0,1, 20)
		create rent.make_filled (0,1, 20)
		create player.make_filled(ex, 1, players)
		create id.make_filled(0, 1, 20)
		from
			i := 1
		until
			i > players
		loop
			create ex.make(1500000)
			player[i] := ex
			i := i + 1
		end
		a[1] := "GO"
		a[2] := "Christ the Redeemer"
		price[2] := 60
		rent[2] := 2
		a[3] := "Luang Pho To"
		price[3] := 60
		rent[3] := 4
		a[4] := "TAX"
		a[5] := "Alyosha monument"
		price[5] := 80
		rent[5] := 4
		a[6] := "JAIL"
		a[7] := "Tokyo Wan Kannon"
		price[7] := 100
		rent[7] := 6
		a[8] := "Luangpho Yai"
		 price[8] := 120
		 rent[8] := 8
		a[9] := "CHANCE"
		a[10] := "The Motherland"
		 price[10] := 160
		 rent[10] := 12
		a[11] := "FREE"
		a[12] := "Awaji Kannon"
		 price[12] := 220
		  rent[12] := 18
		a[13] := "CHANCE"
		a[14] := "Rodina Mat Zovyot"
		 price[14] := 260
		  rent[14] := 22
		a[15] := "Great Buddha of Thailand"
		 price[15] := 280
		  rent[15] := 22
		a[16] := "GO TO JAIL"
		a[17] := "Laykyun Setkyar"
		 price[17] := 320
		 rent[17] := 28
		a[18] := "Spring Temple Buddha"
		 price[18] := 360
		  rent[18] := 35
		a[19] := "CHANCE"
		a[20] := "Statue of Unity"
		 price[20] := 400
		  rent[20] := 50
	end


feature
	game
	do
		from
			left := players
		until
			left = 1
		loop
			from
				i := 1
			until
				i > players
			loop
				if player[i].lose = false then
					rand.forth
					print("Now it's " + i.out + "'s player turn%N")
					print("You have " + (player[i].money / 1000).out + "k%N")
					print("Press enter to play")
					io.read_character
					print("You got " + (rand.item \\ 12 + 1).out + "%N")
					player[i].go(rand.item \\ 12 + 1)
					if player[i].place <= player[i].pre then
						print("You passed the Go cell and you get 200k salary%N")
						player[i].change_money (200000)
					end
					if player[i].place = 1 or a[player[i].place] = 11 then
						--nothing happens
						print("It's free place%N")
					elseif player[i].place = 9 or player[i].place = 13 or player[i].place = 19 then
						print("You are now in chance cell, you can win money or lose%N")
						print("Press enter to see whats gonna happen")
						io.read_character
						rand.forth
						if rand.item \\ 2 = 1 then
							print("You won " + (rand.item \\ 20).out + "k%N")
							player[i].change_money((rand.item \\ 20) * 10000)
						else
							print("You losed " + (rand.item \\ 30).out + "k%N")
							player[i].change_money(- (rand.item \\ 30) * 10000)
						end
					elseif player[i].place = 4 then
						player[i].payByPercent(10)
					elseif player[i].place = 16 then
						print("You are now in jail and you need to pay 50k!%N")
						player[i].jail
					elseif player[i].place = 6 then
						--nothing happens
						print("It's free place%N")
					else
						if id[player[i].place] = 0 then
							print("Do u want to buy " + a[player[i].place] + "?%N")
							print("It costs: " + price[player[i].place].out + "k%N")
							print("If you want to but it, press 1 if not press 0%N")
							io.read_integer
							if io.last_integer = 1 then
								id[player[i].place] := i
								player[i].change_money(- price[player[i].place] * 1000)
							end
						else
							print("It is " + id[player[i].place].out + "'s building and u need to pay " + rent[player[i].place].out + "k%N")
							player[i].change_money (- rent[player[i].place] * 1000);
							player[id[player[i].place]].change_money(rent[player[i].place] * 1000)
						end
					end
					if player[i].lose then
						left := left - 1
					end
				end
				i := i + 1
				print("%N")
			end
		end
	end
end
