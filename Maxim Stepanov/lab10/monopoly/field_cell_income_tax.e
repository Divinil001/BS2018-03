note
	description: "Summary description for {FIELD_CELL_INCOME_TAX}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_CELL_INCOME_TAX
inherit
	FIELD_CELL

feature

	step(p: PLAYER)
	local
		i: INTEGER
	do
		i := p.balance // 10
		p.change_balance (-i)
	end

end
