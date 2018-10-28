class
	PARKING
inherit
	GAME_CELL
create
	make

feature
	pay(p: PLAYER)
	do
		-- does nothing
		print("Just do nothing...%N")
	end

	make
	do
		make_random
	end
end
