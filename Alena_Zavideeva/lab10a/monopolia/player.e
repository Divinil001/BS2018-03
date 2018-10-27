class
	PLAYER
create make

feature
	name: STRING
	position: INTEGER
	properties: ARRAY[LAND]
	money: INTEGER
	in_jail: BOOLEAN
	turn : INTEGER
	alive: BOOLEAN

feature
	make(name_: STRING)
		do
			name := name_
			position := 1
			create properties.make_empty
			--money := 1500
			money := 150
			turn := 0
			in_jail := False
			alive := True
		end

feature -- Command

	add_money(penny : INTEGER)
		do
			money := money + penny
			Io.put_string (get_name + "'s money: " + get_money.out + " %N")
		end

	add_property(land: LAND)
		do
			properties.force (land, properties.count + 1)
		end

	remove_money(penny : INTEGER)
		do

			money := money - penny
			if
				money < 0
			then
				game_over
			end
			Io.put_string (get_name + "'s money: " + get_money.out + " %N")
		end

	change_position(pos: INTEGER)
		do
			position := pos
		end

	change_status_in_jail
		do
			in_jail := True
		end

	game_over
		local
			i : INTEGER
		do
			Io.put_string (Current.get_name + " leaves the game%N")
			from
				i:=1
			until
				i > properties.count
			loop
				properties[i].no_owner
				i := i + 1
			end
			alive := False
		end

	change_rounds_in_jail
		do
			turn := turn + 1
		end
	free
		do
			turn := 0
			in_jail := False
		end

feature -- Query

	get_money: INTEGER
		do
			Result := money
		end
	get_position: INTEGER
		do
			Result := position
		end
	get_name: STRING
		do
			Result := name
		end
	get_turns: INTEGER
		do
			Result := turn
		end

end
