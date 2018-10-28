class
	CHANCE
inherit
	SQUARD

create make

feature
--	time: TIME
	make(name_: STRING; position_: INTEGER)
		do
			name := name_
			position := position_
			--create time.make_now
		end
feature

    rand : integer
        -- Returns random number from 0 to 2^32
        external
            "C inline use <stdlib.h>"
        alias
            "return rand();"
        end

    srand(seed : INTEGER)
        -- Initializes random sequence
        external
            "C inline use <stdlib.h>"
        alias
            "srand($seed);"
        end
    time(): integer
        -- Returns the current time
        external
            "C inline use <time.h>"
        alias
            "return (int)time(0);"
        end

feature
	action(player: PLAYER)
		local
			k : INTEGER
		do
			srand(time + player.get_money)
			if rand \\ 2 = 1 then
				k := rand \\ 200
				if k = 0 then
					k := 200
				else
					k := (k // 10)*10
				end
				Io.put_string (player.get_name + " loses money " + k.out + "%N")
				player.remove_money (k)
			else
				k := rand \\ 200
				if k = 0 then
					k := 200
				else
					k := ((k // 10)*10)
				end
				Io.put_string (player.get_name + " gets money" + k.out + "%N")
				player.add_money (k)
			end
		end
end
