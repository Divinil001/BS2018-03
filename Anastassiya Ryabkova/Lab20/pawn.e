note
	description: "Summary description for {PAWN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAWN

inherit
	PIECE
		redefine
			make, can_move, move, display
		end

create
	make

feature -- Queries
	first_move:BOOLEAN

	not_first_move
		do
			first_move := false
		end

feature
	make(a_colour:INTEGER; a_position:TUPLE[INTEGER, INTEGER])
		do
			Precursor(a_colour, a_position)
			first_move := true
		end


	can_move(new_position:TUPLE[INTEGER, INTEGER]):BOOLEAN
		do
			if new_position.integer_32_item (2) = position.integer_32_item (2) then
				if colour = 0 then
					if first_move then
						if new_position.integer_32_item (1) = position.integer_32_item (1) - 2 or
						new_position.integer_32_item (1) = position.integer_32_item (1) - 1 then
							Result := true
						end
					else
						if new_position.integer_32_item (1) = position.integer_32_item (1) - 1 then
							Result := true
						end
					end
				else
					if first_move then
						if new_position.integer_32_item (1) = position.integer_32_item (1) + 2 or
						new_position.integer_32_item (1) = position.integer_32_item (1) + 1 then
							Result := true
						end
					else
						if new_position.integer_32_item (1) = position.integer_32_item (1) + 1 then
							Result := true
						end
					end
				end
			end
		end

	move(new_position:TUPLE[INTEGER, INTEGER])
		do
			position := new_position
		end

	display
		do
			print("p")
			if colour = 0 then
				print("w")
			else
				print("b")
			end
		end

end
