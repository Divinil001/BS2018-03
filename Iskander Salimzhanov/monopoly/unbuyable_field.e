note
	description: "Summary description for {UNBUYABLE_FIELD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	UNBUYABLE_FIELD
inherit
	FIELD
	redefine
		buy
	end

feature
	buy(a_player: PLAYER)
	require else
		valid_purchase: not current.owner_exists and a_player.get_money >= current.get_cost
	do
	ensure then
		purchase_was_succesful: current.owner_exists and then current.get_owner.is_equal_to(a_player) and then a_player.in_fields (current)
	end

end
