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

	action(player: PLAYER)
		do
			Io.put_string (player.get_name + " " + "gets money" + (200).out + "%N")
			player.add_money(200)
		end
end
