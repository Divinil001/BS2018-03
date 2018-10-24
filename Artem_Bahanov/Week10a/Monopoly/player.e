class
	PLAYER
create
	make
feature
	number: INTEGER
	name: STRING
	current_position: INTEGER
	in_jail: INTEGER -- if 0: not in jail; else he will be in jail for in_jail turns
	money: INTEGER
	properties: ARRAYED_LIST[PROPERTY]

feature
	make(number_n: INTEGER name_n: STRING)
	do
		number := number_n
		name := name_n
		money := 1500
		current_position := 1
		create properties.make(0)
	end

	add_money(add: INTEGER)
	do
		money := money + add
	end

	add_position(add: INTEGER)
	do
		current_position := (current_position + add - 1) \\ 20 + 1
	end

	set_position(n_position: INTEGER)
	do
		current_position := n_position
	end

	add_jail(add: INTEGER)
	do
		in_jail := in_jail + add
	end
end
