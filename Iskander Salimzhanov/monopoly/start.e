note
	description: "Summary description for {START}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	START_FIELD
inherit
	UNBUYABLE_FIELD
	redefine
		act
	end
create
	make

feature
	make(a_industry: WITHOUT_FILIALS)
	do
		set_name("START")
		set_cost(0)
		set_rent(0)
		set_deposit_term(0)
		set_deposit_days(0)
		set_industry(a_industry)
	end

feature
	get_cash(a_player: PLAYER)
	require
		is_not_bankrupt: not a_player.is_bankrupt
	do
		a_player.add_money (rent)
	end

	act(a_player: PLAYER)
	do
		print("Welcom to start point! $N Mr.Monopoly gift you some cash%N")
		get_cash(a_player)
	end
end
