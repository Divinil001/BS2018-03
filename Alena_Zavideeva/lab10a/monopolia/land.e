class
	LAND
inherit SQUARD

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
	buy (owner_ : PLAYER)
		require
			no_owner: owner = Void
		do
			owner := owner_
			owner_.remove_money (price)
		end

	step (player: PLAYER)
		do
			player.remove_money (rent)
			if
				attached owner as o
			then
				o.add_money (rent)
			end
		end
	change_owner (player : PLAYER)
		do
			owner := player
		end

	no_owner
		do
			owner := Void
		end
end
