note
	description: "Class: CHANCE_SQUARE"

class
	CHANCE_SQUARE

inherit
	SQUARE

redefine
	player_on_square
end

create
	make

feature

	number: INTEGER
	random_sequence: RANDOM

	make (n: STRING; num: INTEGER)
	do
		create random_sequence.set_seed ((create {TIME}.make_now).compact_time)
		name := n
		number := num
	end

	player_on_square (p: PERSON)
	local
		x, a: INTEGER
	do
		random_sequence.set_seed ((create {TIME}.make_now).compact_time)

		io.put_string ("You are on Chance square.%N")

		x := get_sign

		if x = 1 then
			a := get_minus
			io.put_string ("You lose " + a.out + "0 RUB %N")
			p.lose_money (a * 10)
		else
			a := get_plus
			io.put_string ("You win " + a.out + "0 RUB %N")
			p.earn_money (a * 10)
		end

	end

	get_sign: INTEGER
    do
    	random_sequence.forth
    	Result := random_sequence.item \\ 2 + 1
   	ensure
    	Result > 0
    end

    get_plus: INTEGER
    do
    	random_sequence.forth
    	Result := random_sequence.item \\ 20000 + 1
   	ensure
    	Result > 0
    end

	get_minus: INTEGER
    do
    	random_sequence.forth
    	Result := random_sequence.item \\ 30000 + 1
   	ensure
    	Result > 0
    end

end
