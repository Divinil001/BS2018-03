note
	description: "Summary description for {PAY_RANDOM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAY_TAX
inherit
	ACTION
create
	make
feature

	description: STRING
		do
			Result := "INCOME 10%% TAX"
		end
	make_action(player: PLAYER)
		do
			player.pay(player.balance // 100 * 10)
		end
end
