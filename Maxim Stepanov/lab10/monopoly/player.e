note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature
	properties: ARRAYED_LIST[PROPERTY]
	balance: INTEGER
	misses_next_turn: BOOLEAN
	position: INTEGER
	in_jail: INTEGER
	game: MONOPOLY

	change_balance(diff: INTEGER)
	do
		balance := balance + diff
	end

	make(g: MONOPOLY)
	do
		game := g

		create properties.make (0)
		balance := 1500
		position := 1
		in_jail := 0
	end

	set_pos(p: INTEGER)
	do
		position := p
	end

	add_property(p: PROPERTY)
	do
		properties.extend (p)
	end

	miss_next_turn
	do
		misses_next_turn := true
	end

	update
	do
		if balance < 0 then
			lose
		end

		misses_next_turn := false
	end

	set_in_jail
	do
		in_jail := 3
	end

	go_out_of_jail
	do
		in_jail := 0
	end

	decr_in_jail
	do
		in_jail := in_jail - 1
	end

	lose
	do
		game.remove_player(Current)
	end

end
