note
	description: "monopoly application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			player, current_player, default_player: PLAYER						----- temporary player
			r: RANDOM
			current_property: STRING
			prop:  ARRAYED_LIST[PROPERTY]							---- temporary list of properties of a player
			-- Run application.
		do
			--| Add your code here
			create prop.make(0)
			create default_player.make ("default", 1500, 1, prop)

			create p1.make(1,"Go",0,0,default_player)
			create p2.make(2,"Christ the Redeemer",60,2,default_player)
			create p3.make(3," Luang Pho To",60,4,default_player)
			create p4.make(4,"Income Tax",0,0,default_player)
			create p5.make(5,"Alyosha monument",80,4,default_player)
			create p6.make(6,"In Jail",0,0,default_player)
			create p7.make(7,"Tokyo Wan Kannon",100,6,default_player)
			create p8.make(8,"Luangpho Yai",120,8,default_player)
			create p9.make(9,"Chance",0,0,default_player)
			create p10.make(10,"The Motherland",160,12,default_player)
			create p11.make(11,"Free Parking",0,0,default_player)
			create p12.make(12,"Awaji Kannon",220,18,default_player)
			create p13.make(13,"Chance",0,0,default_player)
			create p14.make(14,"Rodina-Mat Zovyot!",260,22,default_player)
			create p15.make(15,"Great Buddha of Thailand",280,22,default_player)
			create p16.make(16,"Go to Jail",0,0,default_player)
			create p17.make(17,"Laykyun Setkyar",320,28,default_player)
			create p18.make(18,"Spring Temple Buddha",360,35,default_player)
			create p19.make(19,"Chance",0,0,default_player)
			create p20.make(20,"Statue of Unity",400,50,default_player)


			create board.make(0)
			board.extend(p1)
			board.extend(p2)
			board.extend(p3)
			board.extend(p4)
			board.extend(p5)
			board.extend(p6)
			board.extend(p7)
			board.extend(p8)
			board.extend(p9)
			board.extend(p10)
			board.extend(p11)
			board.extend(p12)
			board.extend(p13)
			board.extend(p14)
			board.extend(p15)
			board.extend(p16)
			board.extend(p17)
			board.extend(p18)
			board.extend(p19)
			board.extend(p20)


			create all_players.make(0)
			create moniker.make (1)
			print("Write number of players: ")
			io.read_integer
			k:=io.last_integer
			io.new_line
			print("Write names of players in the order you will play: ")
			from
				i:=1
			until
				i>k
			loop
				create prop.make(0)
				io.new_line
				io.read_line
				moniker:=io.last_string.twin
				create player.make(moniker, 1500, 1, prop)
				all_players.extend(player)
				i:=i+1
			end


			rounds:=0
			create word1.make(0)
			create word2.make(0)
			create go.make(0)
			--create prop.make(0)
			create current_player.make ("default", 1500, 1, prop)
			current_player:=all_players[1]
			from
			until
				all_players.count=1 or rounds>100
			loop
				print("Write 'go' to next round: ")
				io.read_line
				go:=io.last_string.twin
				print("Round: ")
				print(rounds)
				io.new_line
				create r.set_seed((create{TIME}.make_now).compact_time)
				r.start
				dice1:=r.item\\(6-1)+1
				create r.set_seed((create{TIME}.make_now).compact_time)
				r.start
				dice2:=r.item\\(6-1)+1


				if
					current_player.jail_counter=0
				then
					print("Play with ")
					print(current_player.name)
					print(".")
					io.new_line
					current_player.position:=current_player.position + dice1 + dice2
					create r.set_seed((create{TIME}.make_now).compact_time)      ----- 1 earn, 2 lose
					r.start
					random2:=r.item\\(2-1)+1

					create r.set_seed((create{TIME}.make_now).compact_time)
					r.start
					random3:=r.item\\(200-1)+1

					create r.set_seed((create{TIME}.make_now).compact_time)
					r.start
					random4:=r.item\\(300-1)+1

					print("Info:")
					io.new_line
					from
						i:=1
					until
						i>all_players.count
					loop
						print(all_players[i].name)
						io.new_line
						print(all_players[i].balance)
						io.new_line
						print("Your properties: ")
						from
							l:=1
						until
							l>all_players[i].properties.count
						loop
							print(all_players[i].properties[l].name)
							io.new_line
							l:=l+1
						end
						io.new_line
						i:=i+1
					end

					if
						current_player.position>20
					then
						current_player.position:=current_player.position-20
						current_player.balance:=current_player.balance+200
					end

					create current_property.make (1)
					current_property:=board[current_player.position].name

					print("You are in ")
					print(board[current_player.position].name)
					io.new_line
					if
						current_property~"Income Tax"
					then
						current_player.balance:=current_player.balance-(current_player.balance*0.1).rounded
					elseif
						current_property~"Chance"
					then
						if
							random2=1
						then
							current_player.balance:=current_player.balance+random3
						else
							current_player.balance:=current_player.balance-random4
						end
					elseif
						current_property~"Free Parking"
					then
						current_player.balance:=current_player.balance
					elseif
						current_property~"Go"
					then
						current_player.balance:=current_player.balance+200
					elseif
						current_property~"In Jail"
					then
						print("You visit Jail.")
					elseif
						current_property~"Go to Jail"
					then
						current_player.position:=6
						print("Will you pay a fine?")
						io.new_line
						print("Write 'Yes' if will.")
						io.new_line
						io.read_line
						word1:=io.last_string.twin
						if
							word1~"Yes"
						then
							current_player.balance:=current_player.balance-50
							current_player.position:=current_player.position+dice1+dice2
						else
							current_player.jail_counter:=1
						end
					else
						if
							board[current_player.position].owner=default_player
						then
							print("Will you buy this property?")
							io.new_line
							print("Write 'Yes' if will.")
							io.new_line
							io.read_line
							word2:=io.last_string.twin
							io.new_line
							if
								word2~"Yes"
							then
								current_player.balance:=current_player.balance-board[current_player.position].price
								current_player.properties.extend (board[current_player.position])
								board[current_player.position].owner:=current_player
							else
								print("Why didn't you buy?")
								io.new_line
							end
						else
							current_player.balance:=current_player.balance-board[current_player.position].rent
							board[current_player.position].owner.balance:=board[current_player.position].owner.balance+board[current_player.position].rent
						end
					end
				elseif
					current_player.jail_counter=1 or current_player.jail_counter=2
				then
					if
						dice1=dice2
					then
						current_player.position:=6+dice1+dice2
						current_player.jail_counter:=0
					else
						current_player.jail_counter:=current_player.jail_counter+1
					end
				elseif
					current_player.jail_counter=3
				then
					if
						dice1=dice2
					then
						current_player.position:=6+dice1+dice2
						current_player.jail_counter:=0
					else
						current_player.balance:=current_player.balance-50
						current_player.position:=current_player.position+dice1+dice2
						current_player.position:=0
					end
				end

				current_player:=change_player(current_player)
				rounds:=rounds+1
			end
		end

feature
	change_player(a:PLAYER):PLAYER
		do
			all_players.search (a)
			if
				all_players.index=all_players.count
			then
				Result:=all_players[1]
			else
				Result:=all_players[all_players.index+1]
			end
			all_players.go_i_th (1)
		end

feature
	p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20: PROPERTY		---- all properties
	board: ARRAYED_LIST[PROPERTY]							---- list of all properties
	all_players: ARRAYED_LIST[PLAYER]						---- list of all players
	k,i,l,dice1,dice2,random1, random2, random3, random4, rounds: INTEGER
	moniker, word1,word2, go: STRING											---- temporary name of a player

end
