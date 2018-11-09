note
	description: "monopoly application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			board: BOARD
			player1: PLAYER
			player2: PLAYER
			fields: ARRAYED_LIST [FIELD]
			field: FIELD
			industry1, industry2, industry3: INDUSTRY
			-- Run application.
		do
			create player1.make (500, 1)
			create player2.make (500, 2)
			create board.make
			board.add_player (player1)
			board.add_player (player2)
			create {WITHOUT_FILIALS} industry1.make

			create {BUYABLE_FIELD} field.make ("Zoo", 10, 3, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("Cinema", 12, 4, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("Computer Club", 14, 5, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("Apple", 16, 6, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("Twitter", 18, 7, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("Facebook", 20, 8, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("College", 21, 9, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("University", 24, 10, 15, 5, industry1, Void)
			board.add_field (field)

			create {BUYABLE_FIELD} field.make ("I_I_IaraGa", 30, 15, 15, 5, industry1, Void)
			board.add_field (field)

			from
			until
				board.game_over
			loop
				board.step
			end
			--| Add your code here
			print ("Hello Eiffel World!%N")
		end

end
