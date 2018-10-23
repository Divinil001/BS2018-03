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

feature
	make(name_: STRING)
		do
			name := name_
			position := 1
			create properties.make_empty
			money := 1500
			turn := 0
			in_jail := False
		end

feature -- Command

	add_money(penny : INTEGER)
		do
			money := money + penny
		end

	remove_money(penny : INTEGER)
		do
			money := money - penny
		end

	change_position(pos: INTEGER)
		do
			position := pos
		end

	change_status_in_jail
		do
			in_jail := True
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

end
