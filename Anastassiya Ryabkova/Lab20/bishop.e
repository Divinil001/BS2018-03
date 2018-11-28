note
	description: "Summary description for {BISHOP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BISHOP

inherit
	PIECE
		redefine
			can_move, display
		end

create
	make

feature
	can_move(new_position:TUPLE[INTEGER, INTEGER]):BOOLEAN
		do
			if  new_position.integer_32_item (1) = new_position.integer_32_item (2) + (position.integer_32_item (1) - position.integer_32_item (2)) then
				if new_position.integer_32_item (1) /= position.integer_32_item (1) and new_position.integer_32_item (2) /= position.integer_32_item (2) then
					Result := true
				end
			elseif new_position.integer_32_item (1) - position.integer_32_item (1) = position.integer_32_item (2) - new_position.integer_32_item (2) then
				if new_position.integer_32_item (1) /= position.integer_32_item (1) and new_position.integer_32_item (2) /= position.integer_32_item (2) then
					Result := true
				end
			end
		end

	display
		do
			print("B")
			if colour = 0 then
				print("w")
			else
				print("b")
			end
		end

end