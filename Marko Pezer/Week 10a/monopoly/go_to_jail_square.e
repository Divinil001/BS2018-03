note
	description: "Class: GO_TO_JAIL_SQUARE"

class
	GO_TO_JAIL_SQUARE

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
		io.put_string ("You are going to jail!%N")
		p.set_position (6)
		p.set_days_in_jail (4)
	end

end
