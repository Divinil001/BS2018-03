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
	make(a_name:STRING)
		do
			create property.make (0)
			set_name(a_name)
			set_money(1500)
			set_position(1)
			set_in_jail(false)
			set_in_game(true)
			set_days_in_jail(0)
		end
	set_name(a_name: STRING)
		do
			name:=a_name
		end

	set_money(a_money: INTEGER)
		do
			money:=a_money
		end

	set_property(num_sq: INTEGER)
		do
			property.extend (num_sq)
		end

	set_position(a_position: INTEGER)
		do
			position:=a_position
		end

	set_in_jail(a_in_jail:BOOLEAN)
		do
			in_jail:=a_in_jail
		end
	set_in_game(a_in_game: BOOLEAN)
		do
			in_game:=a_in_game
		end

	set_days_in_jail(a:INTEGER)
		do
			days_in_jail:=a
		end


feature
	money: INTEGER
	name: STRING
	position: INTEGER
	property: ARRAYED_LIST[INTEGER]
	in_jail: BOOLEAN
	days_in_jail: INTEGER
	in_game: BOOLEAN
end
