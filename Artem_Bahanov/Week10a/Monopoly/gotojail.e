class
	GOTOJAIL
inherit
	GAME_CELL
create make
feature
	pay(p: PLAYER)
	do
		p.add_jail(3)
		p.set_position(6)
		print("You are in jail now!%N")
	end

	make
	do
		make_random
	end
end
