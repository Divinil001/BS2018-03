note
	description: "Class: FREE_SQUARE"

class
	FREE_SQUARE

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
	do
		io.put_string ("You are on square: " + name + " (" + number.out + ")%N")
	end

end
