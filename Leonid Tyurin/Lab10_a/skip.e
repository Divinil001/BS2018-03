note
	description: "Summary description for {SKIP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SKIP
inherit
	ACTION
create
	make
feature
	description: STRING
		do
			Result := "FREE PARKING"
		end
	make_action(player: PLAYER)
		do
			print("Do nothing")
		end
end
