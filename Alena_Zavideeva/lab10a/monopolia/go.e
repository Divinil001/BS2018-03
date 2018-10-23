class
	GO
inherit SQUARD

create make

feature
	make(name_: STRING; position_: INTEGER)
		do
			name := name_
			position := position_
		end
feature

	add_money(player: PLAYER)
		do
			player.add_money(200)
		end
end
