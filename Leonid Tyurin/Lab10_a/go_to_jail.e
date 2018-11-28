note
	description: "Summary description for {GO_TO_JAIL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GO_TO_JAIL
inherit
	ACTION
create
	make
feature
	description: STRING
		do
			Result := "GO TO JAIL"
		end
	make_action(player: PLAYER)
		do
			player.go_to_jail
		end
end

