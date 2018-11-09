note
	description: "Summary description for {RUSSIAN_ROULLETE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RUSSIAN_ROULLETE
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
		set_name("RUSSIAN ROULETTE")
		set_cost(0)
		set_rent(0)
		set_deposit_term(0)
		set_deposit_days(0)
		set_industry(a_industry)
	end

feature
	shaffle: INTEGER
	local
		random_seq: RANDOM
	do
		create random_seq.make
		random_seq.forth
		Result := random_seq.item \\ 6 + 1
	end

	act(a_player: PLAYER)
	local
		x: INTEGER
	do
		print("Choose number of bullets (from 1 to 6) %N")
		io.read_integer
		x := io.last_integer
		if x > 6 then
			print("Are you idiot? %N Try again")
			act(a_player)
		end
		print("Well FOR MOTHER RUSSIA %N")
		if x < shaffle then
			print("BANG %N")
			a_player.to_bankrupt
		else
		end
	end
end
