note
	description: "Summary description for {IN_JAIL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IN_JAIL
inherit
	ACTION
create
	make
feature

	description: STRING
		do
			Result := "IN_JAIL"
		end
	make_action(player: PLAYER)
		do
			if player.in_jail > 0 then
				print("Want to get out of the jail for 50K?%Ny/n?%N")
				io.read_line
				if io.last_string ~ "y" then
					player.pay (50)
					player.decrease_in_jail(0)
				else
					if player.dice1 = player.dice2 then
						player.decrease_in_jail(0)
					else
						player.decrease_in_jail(player.in_jail - 1)
						if player.in_jail > 0 then
							print("Stay in jail%N")
						end
					end
				end
			else
				print("Do nothing")
			end
		end
end
