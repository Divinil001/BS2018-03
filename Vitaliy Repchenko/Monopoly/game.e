note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME
create
	play
feature
	play
		local
			j:INTEGER
		do
			create rand_1.make
			create rand_2.make
			create rand_3.make
			k:=100
			make_board
			from i:=1
			until i>k or end_of_the_game
			loop
				from j:=1
				until j>players.count
				loop
					turn(j)
					j:=j+1
				end
				i:=i+1
			end
			print("%N WINNERS:")
			from i:=1
			until i>players.count
			loop
				if players[i].in_game then
					print("%N"+players[i].name)
				end
			end
		end

	set_dice_1(a_dice_1: INTEGER)
		do
			dice_1:=a_dice_1
		end

	set_dice_2(a_dice_2: INTEGER)
		do
			dice_2:=a_dice_2
		end

	make_board
		local
			qwerty: FIELD
			pl: PLAYER
			numb: INTEGER
			nam: STRING
		do
			create pl.make ("void")
			print("%N%N%NWrite number of players:")
			io.read_integer
			numb:=io.last_integer+0
			from
			until  (numb>=2 and numb<=6)
			loop
				print(" Write number of players:")
				io.read_integer
				numb:=io.last_integer+0
			end

			create players.make_filled (pl, 1, numb)
			from i:=1
			until i>players.count
			loop
				print("Write player name:")
				io.read_line
				nam:=io.last_string+""
				create pl.make (nam)
				set_players(pl, i)
				i:=i+1
			end

			create qwerty.make ("GO", 0, 0)
			create board.make_filled(qwerty,1,20)
			set_board(qwerty, 1)
			create qwerty.make ( "Christ the Redeemer", 60, 2)
			set_board(qwerty, 2)
			create qwerty.make ("Luang Pho To" ,60, 4)
			set_board(qwerty, 3)
			create qwerty.make ("INCOME TAX",0 ,0)
			set_board(qwerty, 4)
			create qwerty.make ("Alyosha monument", 80, 4)
			set_board(qwerty, 5)
			create qwerty.make ("JAIL",0 ,0)
			set_board(qwerty, 6)
			create qwerty.make ("Tokyo Wan Kannon", 100, 6)
			set_board(qwerty, 7)
			create qwerty.make ( "Luangpho Yai", 120, 8)
			set_board(qwerty, 8)
			create qwerty.make ("CHANCE",0 ,0)
			set_board(qwerty, 9)
			create qwerty.make ("The Motherland", 160, 12)
			set_board(qwerty, 10)
			create qwerty.make ("FREE PARKING",0 ,0)
			set_board(qwerty, 11)
			create qwerty.make ("Awaji Kannon", 220, 18)
			set_board(qwerty, 12)
			create qwerty.make ("CHANCE",0 ,0)
			set_board(qwerty, 13)
			create qwerty.make ( "Rodina-Mat%'Zovyot", 260, 22)
			set_board(qwerty, 14)
			create qwerty.make ("Great Buddha of Thailand", 280, 22)
			set_board(qwerty, 15)
			create qwerty.make ("GO TO JAIL",0 ,0)
			set_board(qwerty, 16)
			create qwerty.make ( "Laykyun Setkyar", 320, 28)
			set_board(qwerty, 17)
			create qwerty.make ("Spring Temple Buddha", 360, 35)
			set_board(qwerty, 18)
			create qwerty.make ("CHANCE",0 ,0)
			set_board(qwerty, 19)
			create qwerty.make ("Statue of Unity", 400, 50)
			set_board(qwerty, 20)
		end

	drop_dice
		do

			rand_1.forth
			set_dice_1(rand_1.item\\6+1)
			rand_2.set_seed (rand_1.item)
			rand_2.forth
			set_dice_2(rand_2.item\\6+1)
		end

	stats(player: INTEGER)
		do
			print("Name: "+players[player].name)
			io.read_line
			print("MONEY: "+players[player].money.out+"k")
			io.read_line
			print("PROPERTY:")
			io.read_line
			from
				i:=1
			until
				i>players[player].property.count
			loop
				print("    "+board[players[player].property[i]].name)
				io.read_line
				i:=i+1
			end
		end

	change_position(player: INTEGER)
		local
			pos: INTEGER
			gift:INTEGER
		do
			pos:=(players[player].position+dice_1+dice_2)\\20
			if pos = 0 then
				pos:=20
			end
			Print("You on the square "+board[pos].name)
			io.read_line
			if players[player].position > pos then
				players[player].set_money (players[player].money+200)
				print("You have been on the squae GO  +200k")
				io.read_line
			end
			players[player].set_position (pos)
			if pos=6 or pos = 11 or pos = 4 or pos=16 or pos=9 or pos=13 or pos=19  then
				if not (pos=6 or pos = 11) then
					if pos = 4 then
						gift:=players[player].money//10
						players[player].set_money ((players[player].money-gift))
						print("You mast pay INCOME TAX   -"+gift.out+"k")
						io.read_line
						if players[player].money<0 then
							player_lose(player)
						end
					end
					if pos=16 then
						players[player].set_in_jail (true)
						players[player].set_position (6)
					end
					if pos=9 or pos=13 or pos=19 then

						rand_3.forth
						if rand_3.item\\2=0 then
							rand_3.forth
							gift:=(rand_3.item\\30+1)*10
							players[player].set_money ((players[player].money-gift))
							print("You were unlucky!!!   +"+gift.out+"k")
							io.read_line
							if players[player].money<0 then
								player_lose(player)
							end
						else
							rand_3.forth
							gift:=(rand_3.item\\20+1)*10
							players[player].set_money ((players[player].money+gift))
							print("Lucky you!!!  +"+gift.out+"k")
							io.read_line
						end
					end
				end
			else

				buying(player)
			end
		end

	buying(player: INTEGER)
		do
			if not (board[players[player].position].property=player) then
				if board[players[player].position].property=0 then
					if players[player].money >= board[players[player].position].price  then
						print("Do you want to buy"+board[players[player].position].name+"? %NPrice: "+board[players[player].position].price.out+"k"+"%NTax: "+board[players[player].position].tax.out+" (YES(1)/NO(anything except 1))")
						io.read_integer
						if io.last_integer=1 then
							players[player].set_money (players[player].money-board[players[player].position].price)
							players[player].set_property (players[player].position)
							board[players[player].position].set_property(player)
						end
					else
						print("You can%'t buy it")
						io.read_line
					end
				else
					print("You must pay the tax. %NTax: "+board[players[player].position].tax.out+"k")
					io.read_line
					if players[player].money >= board[players[player].position].tax  then
						players[player].set_money (players[player].money-board[players[player].position].tax)
						players[board[players[player].position].property].set_money (players[board[players[player].position].property].money+board[players[player].position].tax)
					else
						player_lose(player)
						players[board[players[player].position].property].set_money (players[board[players[player].position].property].money+players[player].money)
					end
				end
			end
		end

	turn(player: INTEGER)
		do
			if players[player].in_game then
				if players[player].in_jail = false then
					print("__________________________________________________________%N")
					stats(player)
					print("__________________________________________________________%N")
					drop_dice
					print("DICE: "+dice_1.out+" "+dice_2.out)
					io.read_line
					print("__________________________________________________________%N")
					io.read_line
					change_position(player)
					if players[player].in_game then
						print("__________________________________________________________%N")
						stats(player)
					end
				else
					print("__________________________________________________________%N")
					stats(player)
					print("__________________________________________________________%N")
					drop_dice
					print("DICE: "+dice_1.out+" "+dice_2.out)
					io.read_line
					print("__________________________________________________________%N")
					io.read_line
					players[player].set_days_in_jail (players[player].days_in_jail+1)
					if dice_1=dice_2 then
						players[player].set_in_jail (false)
						turn(player)
					end
					if players[player].days_in_jail = 3 then
						print("Days in jail:"+players[player].days_in_jail.out+"%NYou must pay 50k")
						io.read_line
						print("You are free!!!")
						players[player].set_days_in_jail (0)
						players[player].set_money (players[player].money-50)
						players[player].set_in_jail (false)
						if players[player].money<0 then
							player_lose(player)
						end
						turn(player)
					end
					print("Days in jail:"+players[player].days_in_jail.out)
					io.read_line
				end
			end
		end

	player_lose(player: INTEGER)
		do
			print(""+players[player].name+" lose!!!")
			io.read_line
			players[player].set_in_game (false)
			from i:=1
			until i>players[player].property.count
			loop
				board[players[player].property[i]].set_property(0)
				i:=i+1
			end
		end

	end_of_the_game: BOOLEAN
		local
			num:INTEGER
		do
			from i:=1
			until i>players.count
			loop
				if
					players[i].in_game=true
				then
					num:=num+1
				end
				i:=i+1
			end
			Result:=(num=1)
		end

	set_board(field:FIELD; j:INTEGER)
		do
			board.enter (field, j)
		end

	set_players(player:PLAYER; j:INTEGER)
		do
			players.enter (player, j)
		end
feature
	board:ARRAY[FIELD]
	players: ARRAY[PLAYER]
	k:INTEGER
	i:INTEGER
	dice_1, dice_2: INTEGER
	rand_1, rand_2, rand_3: RANDOM
end
