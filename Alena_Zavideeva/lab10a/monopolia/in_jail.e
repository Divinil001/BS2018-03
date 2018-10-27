class
	IN_JAIL
inherit SQUARD

create make

feature
	--time: TIME
	make(name_: STRING; position_: INTEGER)
		do
			name := name_
			position := position_
			--create time.make_now
		end
	action(player: PLAYER)
		local
			dice1, dice2, k : INTEGER
		do
			if player.in_jail = True then
				if player.get_turns = 3 then
					Io.put_string ("Player, you will be free if you pay 50K%N" )
					if player.get_money < 50
					then
						player.game_over

					else
						player.remove_money (50)
						player.free
					end
				else
					Io.put_string (player.get_name + " will be free if you pay 50K or player can try and throw a double%N")
					Io.put_string(player.get_name + " throws dice" + "%N")
					srand(time + player.get_money + 19)
					dice1 := rand \\ 6
					dice2 := rand \\ 6
					if dice1 = 0 then
						dice1 := 6
					end
					if dice2 = 0 then
						dice2 := 6
					end
					if dice1 = dice2 then
						Io.put_string ("The dices are " + dice1.out + " " + dice2.out + "%N")
						Io.put_string (player.get_name + " threw a double! Now " + player.get_name + " is free")
						k := (dice1 + dice2 + player.get_position - 1) \\ 20 + 1
						player.change_position (k)
						player.free
					else
						Io.put_string ("The dices are " + dice1.out + " " + dice2.out + "%N")
						Io.put_string (player.get_name + " couldn't throw a double. " +  player.get_name + " is still in jail. Will you pay 50K for freedom? (Y/N) %N")
						Io.read_line
						if Io.last_string.out ~ "Y" and player.get_money >= 50 then
							player.free
							player.remove_money (50)
							k := dice1 + dice2
						else
							k := 6
							player.change_rounds_in_jail
						end
						player.change_position (k)
					end
				end
			end
		end
feature -- Random

    srand(seed : INTEGER)
        -- Initializes random sequence
        external
            "C inline use <stdlib.h>"
        alias
            "srand($seed);"
        end

    rand : integer
        -- Returns random number from 0 to 2^32
        external
            "C inline use <stdlib.h>"
        alias
            "return rand();"
        end
      time(): integer
        -- Returns the current time
        external
            "C inline use <time.h>"
        alias
            "return (int)time(0);"
        end
end
