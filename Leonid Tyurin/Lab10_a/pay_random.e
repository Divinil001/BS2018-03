note
	description: "Summary description for {PAY_RANDOM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAY_RANDOM
inherit
	ACTION
		rename
			make as make1
		end
create
	make
feature
	random: RANDOM
	description: STRING
		do
			Result := "CHANCE"
		end

	make(new_position: INTEGER)
		local
			l_seed: INTEGER
			l_time: TIME
		do
			make1(new_position)
			create l_time.make_now
      		l_seed := l_time.hour
      		l_seed := l_seed * 60 + l_time.minute
      		l_seed := l_seed * 60 + l_time.second
      		l_seed := l_seed * 1000 + l_time.milli_second
			create random.set_seed (l_seed)
		end

	make_action(player: PLAYER)
		local
			payment: INTEGER
		do
			payment := ((random.item \\ 51) - 30) * 10
			random.forth
			print("You are on CHANCE%N")
			player.pay(-payment)
		end
end
