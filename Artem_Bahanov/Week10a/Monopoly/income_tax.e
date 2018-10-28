class
	INCOME_TAX
inherit
	GAME_CELL
create
	make
feature
	pay(p: PLAYER)
	local
		tax_n: INTEGER
	do
		tax_n := p.money // 100 * 10
		p.add_money (- tax_n)
		print("You need to pay a tax (" + tax_n.out + "K RUB)%NYour money: " + p.money.out + "K RUB%N")
	end

	make
	do
		make_random
	end

end
