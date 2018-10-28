class
	LAND
inherit SQUARD
redefine
	action
end
create make

feature
	price: INTEGER
	rent : INTEGER
	owner : detachable PLAYER

	make(name_: STRING; position_: INTEGER; price_: INTEGER; rent_: INTEGER)
		do
			name := name_
			position := position_
			price := price_
			rent := rent_
			owner := Void
		end
feature -- Queries
	get_owner : detachable PLAYER
		do
			Result := owner
		end

feature -- Commands
	action (player: PLAYER)
		do
			if owner = Void then
				Io.put_string (player.get_name+ " can buy this property. Do you want to buy property? Y/N%N")
				Io.put_string ("Price: " + price.out + " " + "Rent: " + rent.out + "%N")
				Io.readline

				if
					Io.last_string.out ~ "Y" and player.get_money >= price
				then
					Io.put_string (player.get_name + " bought property%N")
					owner := player
					player.remove_money (price)
				elseif Io.last_string.out ~ "Y" then
					Io.put_string (player.get_name + " hasn't enough money for buying this property%N")
				end
			else
				if attached owner as own then
					Io.put_string ("This property is sold." + player.get_name + " payes money player: " + own.get_name + "%N")
					player.remove_money (rent)
					own.add_money (rent)
					if player.get_money < 0 then
						player.game_over
					end
				end
			end
		end

	no_owner
		do
			owner := Void
		end
end
