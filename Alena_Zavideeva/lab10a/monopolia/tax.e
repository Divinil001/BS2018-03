class
	TAX
inherit SQUARD

create make

feature
	make(name_: STRING; position_: INTEGER)
		do
			name := name_
			position := position_
		end
feature
	action(player: PLAYER)
		do
			player.remove_money ((player.get_money * 0.1).truncated_to_integer)
		end
end
