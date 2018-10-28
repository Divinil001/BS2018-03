note
	description: "Summary description for {FIELD_CELL_CHANCE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_CELL_CHANCE
inherit
	FIELD_CELL

feature

	step(p: PLAYER)
	local
		r: RANDOM
		change: INTEGER
	do
		create r.make
		r.start
		r.forth
		change := -300 + r.item \\ 501
		change := (change // 10) * 10
		p.change_balance (change)
	end

end
