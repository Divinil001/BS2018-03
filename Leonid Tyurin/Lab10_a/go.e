note
	description: "Summary description for {GO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GO
inherit
	ACTION
create
	make
feature
	description: STRING
		do
			Result := "GO"
		end
	make_action(player: PLAYER)
		do
			print("Get your salary%N")
			player.pay(-200)
		end
end
