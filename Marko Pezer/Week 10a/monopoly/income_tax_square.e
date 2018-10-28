note
	description: "Class: INCOME_TAX_SQUARE"

class
	INCOME_TAX_SQUARE

inherit
	SQUARE

redefine
	player_on_square
end

create
	make

feature

	number: INTEGER

	make (n: STRING; num: INTEGER)
	do
		name := n
		number := num
	end

	player_on_square (p: PERSON)
	local
		x: INTEGER
	do
		io.put_string ("You are on Income tax square.%N")

		x := (p.money // 10)
		x := x - (x \\ 10)
		p.lose_money (x)

		io.put_string ("You lose 10 percent of your money (" + x.out + " RUB)%N")

	end

end
