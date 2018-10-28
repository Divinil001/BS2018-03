class
	FREE_PARKING
inherit SQUARD

create make

feature
	make(name_: STRING; position_: INTEGER)
		do
			name := name_
			position := position_
		end
	action(player: PLAYER)
		do
		end
end
