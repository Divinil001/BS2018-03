class
	CHANCE
inherit
	SQUARD

create make

feature
	make(name_: STRING; position_: INTEGER)
		do
			name := name_
			position := position_
		end
feature

    rand() : integer
        -- Returns random number from 0 to 2^32
        external
            "C inline use <stdlib.h>"
        alias
            "return rand();"
        end

feature
	try_your_luck(player: PLAYER)
		local
			k : INTEGER
		do
			if rand \\ 2 = 1 then
				k := rand \\ 200
				if k = 0 then
					player.remove_money (200)
				else
					player.remove_money ((k // 10)*10)
				end
			else
				k := rand \\ 200
				if k = 0 then
					player.add_money (200)
				else
					player.add_money ((k // 10)*10)
				end
			end
		end
end
