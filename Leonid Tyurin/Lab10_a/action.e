note
	description: "Summary description for {ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ACTION
feature
	position: INTEGER
	description: STRING
		deferred
		end
	make(new_position: INTEGER)
		do
			position := new_position
		end
	make_action(player: PLAYER)
		deferred
		end
end
