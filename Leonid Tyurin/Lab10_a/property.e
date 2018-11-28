note
	description: "Summary description for {PROPERTY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PROPERTY
inherit
	ACTION
		rename
			make as make1
		end
create
	make
feature
	name: STRING
	cost, rent: INTEGER
	owner: detachable PLAYER

	description: STRING
		do
			Result := "PROPERTY %"" + name + "%""
		end
	make (new_position: INTEGER; new_name: STRING; new_cost, new_rent: INTEGER)
		do
			make1(new_position)
			name := new_name
			cost := new_cost
			rent := new_rent
		end

	make_action(player: PLAYER)
		do
			if owner = Void and player.balance >= cost then
				print("Want to buy " + name + " for " + cost.out + "K?%Ny/n?%N")
				io.read_line
				if io.last_string ~ "y" then
					owner := player
					player.pay (cost)
					print("You have bought new property%N")
				else
					print("Do nothing")
				end
			elseif attached owner as owner1 and player /= owner then
				print("Yoy should pay a rent for this property, it's owner is " + owner1.name + "%N")
				player.pay (rent)
			else
				print("Do nothing")
			end
		end
end
