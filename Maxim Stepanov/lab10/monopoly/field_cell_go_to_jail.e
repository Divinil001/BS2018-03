note
	description: "Summary description for {FIELD_CELL_GO_TO_JAIL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_CELL_GO_TO_JAIL
inherit
	FIELD_CELL

feature

	step(p: PLAYER)
	local
		in_jail_pos: INTEGER
		i: INTEGER
	do
		p.set_in_jail

		in_jail_pos := 0

		-- Find "in jail" position
		from
			i := 1
		until
			i > p.game.field.cells.count
		loop
			if attached {FIELD_CELL_IN_JAIL} p.game.field.cells[i] as jail then
				in_jail_pos := i
			end

			i := i + 1
		end

		p.set_pos (i)
	end

end
