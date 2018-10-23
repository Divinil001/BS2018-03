note
	description: "Class: PERSON"

class
	PERSON

create
	make

feature

	id: INTEGER
	name: STRING
	money: INTEGER
	position: INTEGER
	days_in_jail: INTEGER
	loser: BOOLEAN

feature

	make (i: INTEGER; n: STRING)
	do
		id := i
		name := n
		money := 1500000
		position := 1
		days_in_jail := 0
		loser := False
	end

	set_name (n: STRING)
	do
		name := n
	end

	set_position (p: INTEGER)
	do
		position := p
	end

	set_days_in_jail (d: INTEGER)
	do
		days_in_jail := d
	end

	set_loser (flag: BOOLEAN)
	do
		loser := flag
	end

	earn_money (a: INTEGER)
	do
		money := money + a
	end

	lose_money (a: INTEGER)
	do
		money := money - a
		if money < 0 then
			loser := true
		end
	end

	print_info
	do
		io.put_string ("Amount of money: " + money.out + " RUB %N%N")
	end

end
