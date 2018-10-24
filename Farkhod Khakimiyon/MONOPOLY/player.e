class
	PLAYER

create
	make

feature
	money: INTEGER
	place: INTEGER
	lose: BOOLEAN
	pre: INTEGER
	make(start_money: INTEGER)
	do
		money := start_money
		place := 1
		pre := 1
		lose := false
	end
	change_money(dif: INTEGER)
	require
		lose = false
	do
		money := money + dif
		if money < 0 then
			lose := true
		end
	end
	go(dif: INTEGER)
	do
		pre := place
		place := (place + dif - 1) \\ 20 + 1
	end
	jail
	do
		place := 6
		change_money(-50000)
	end
	payByPercent(x: INTEGER)
	do
		money := money - (money * x) // 100
	end
end
