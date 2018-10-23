class
	GO_TO_JAIL

inherit SQUARD

create make

feature
	make(name_: STRING; position_: INTEGER)
		do
			name := name_
			position := position_
		end

feature
	jail(player: PLAYER)
		do
			player.change_position (6)
			player.change_status_in_jail
		end
end
