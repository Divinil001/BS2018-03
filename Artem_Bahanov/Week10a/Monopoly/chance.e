class
	CHANCE
inherit
	GAME_CELL
create
	make
feature
	pay(p: PLAYER)
	local
		money: INTEGER
	do
		money := (random(51) - 20) * 10
		p.add_money (money)
		if money > 0 then
			print("Congrats! You won some money on 'Chance' cell!%NYour money: " + p.money.out + "K RUB%N")
		else
			print("Sorry, but you lose some money on 'Chance' cell:(%NYour money: " + p.money.out + "K RUB%N")
		end
	end

	make
	do
		make_random
	end
end
