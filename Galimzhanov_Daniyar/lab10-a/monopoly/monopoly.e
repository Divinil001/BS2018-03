note
	description: "Summary description for {MONOPOLY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
    MONOPOLY

create
    create_game

feature{MONOPOLY}
    players:ARRAY[PLAYER]
    board:BOARD
    num_steps:INTEGER
    i:INTEGER
    j:INTEGER
    z:INTEGER
    board2:BOARD

feature{MONOPOLY, APPLICATION}
    create_game
        --creation of monopoly
        local
            index:INTEGER
            max_num_players:INTEGER
            name:STRING
            player:PLAYER
            num_position:INTEGER
            flag:BOOLEAN
        do
            print("WELCOME TO THE MONOPOLY GAME%N" + "Maximum number of players is 6%N")
            create board.create_board
            create board2.create_board
            --CREATION OF PLAYERS
            create players.make_empty
            print("Write the number of players %N")


           	io.read_integer
            max_num_players:=io.last_integer.twin



            from index:=1 until index>max_num_players loop
                print("Chose the name of your player%N")
                io.read_line
                name:=io.last_string.twin
                create player.create_player(name)
                players.force(player, index)
                index:=index+1
            end
            print("%N")
            from index:=1 until index>players.count loop
                print("Player " + index.out + " " + players.at(index).name + "%N")
                index:=index+1
            end
            print("%N")
            --MAIN GAME--
            from index:=1 until flag = true loop
                --avoid overflow
                if index > max_num_players then
                    index:=1
                end



                player:=players[index] -- choose player
                player.check_budget
				
                if player.check_activity then
                    print("%N")
                    print("Player " + player.name + " out of the game")
                    player:=players[index+1]
                end

                if player.check_jail then
                    print("Players: %N")
                    print(player.name + " lose move because he is in jail%N")
                    player:=players[index+1]
                end
                if player.number_of_steps > 100 then
                    print("GAME IS OVER. 100 MOVES IS ACHIEVED%N")
                    print("List of champions%N")
                    from z:=1 until z>players.count loop
                        if not players[z].check_activity then
                            print(players[z].name+"%N")
                        end
                        z:=z+1
                    end
                    flag:=true
                end
                player.action
                num_position:=player.number_of_steps \\ 20
                player.set_position(board.at(num_position))
                if player.position ~ "INCOME TAX" then
                    print("%N")
                    print("You at the position " + player.position +"%N")
                    print("PAY TAXES!!!%N")
                    player.income_tax
                    print("Your current balance: " + player.budget.out + "%N")
                    index:=index+1
                elseif player.position ~ "CHANCE" then
                    print("%N")
                    print("You at the position " + player.position +"%N")
                    print("HMMMM, TRY YOUR LUCK%N")
                    player.chance_money
                    print("Your current balance: " + player.budget.out + "%N")
                    index:=index+1
                elseif player.position ~ "IN JAIL" then
                    print("%N")
                    print("You at the position " + player.position +"%N")
                    print("You are driving past prison. So good to feel that you are not one of theese guys who are captured for corruption. But who knows what will happen in the future...%N")
                    index:=index+1
                elseif player.position ~ "GO TO JAIL" then
                    print("%N")
                    print("You at the position " + player.position +"%N")
                    print("YOU WAS CAPTURED FOR CORRUPTION!%N")
                    print("GO TO THE JAIL or pay a fine...(50k)%N")
                    print("Two choices: 'no' or 'pay a fine' ")
                    print("%N")
                    io.read_line
                    if io.last_string.twin ~ "no" then
                        num_position:=6
                        player.go_to_jail
                    elseif io.last_string.twin ~ "pay a fine" then
                        player.pay_fine
                    end
                elseif player.position ~ board2.at(num_position) + " SOLD" then
                    print("%N")
                    print("You should pay rent%N")
                    from i:=1 until i>players.count loop
                        if players[i].check_ownership(board2.at(num_position)) then
                            players[i].get_rent(board2.rent(num_position))
                            print(players[i].name + " gets rent from " + player.name + "%N")
                            print(players[i].name + " balance: " + players[i].budget.out + "%N")
                        end
                        i:=i+1
                    end
                    player.rent(board.rent(num_position))
                    print("Your current balance: " + player.budget.out + "%N")
                    index:=index+1
                elseif player.position ~ "START" or (player.number_of_steps >= 20 and player.number_of_steps < 40) or (player.number_of_steps >= 40 and player.number_of_steps < 60) or (player.number_of_steps >= 60 and player.number_of_steps < 80) then
                    print("%N")
                    print("319 GIVES YOU YOUR SALARY(/STIPA_PRISHLA)%N")
                    player.get_salary
                    print("Your current balance: " + player.budget.out + "%N")
                elseif player.position ~ "FREE PARKING" then
                    print("%N")
                    print("Just free parking, no rent, no loose, boring....%N")
                    index:=index+1
                else
                    print("%N")
                    print("You at the position " + player.position +"%N")
                    print("You should pay rent or you can buy this place%N")
                    print("If you want buy it write 'buy', in other case 'no' %N")
                    print("%N")
                    io.read_line
                    if io.last_string.twin ~ "buy" then
                        player.buy(board.price(num_position), board.at(num_position))
                        board.change(num_position, board.at(num_position) + " SOLD")
                        index:=index+1
                    elseif io.last_string.twin ~"no" then
                        player.rent(board.rent(num_position))
                        index:=index+1
                    end
                end

            end
        end





end
