note
	description: "ConnectFour application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	is_win, is_turn_made:BOOLEAN
	i, j, k, u, curr_player, n, m:INTEGER
	game_board:BOARD
	curr_player_chip:CHARACTER


	make
		do
			is_win := false
			is_turn_made := false
			curr_player := 1
			curr_player_chip := 'O'

			print("Rows : ")
			io.read_integer
			m := io.last_integer
			print("Columns : ")
			io.read_integer
			n := io.last_integer

			create game_board.make(m, n)

			from
				k := 0
			until
				is_win
			loop
				system("cls")

				game_board.board_out

				io.put_string ("Player " + curr_player.out + " turn ")
				io.read_integer
				game_board.make_turn (curr_player_chip, curr_player, m, io.last_integer )
				is_win := game_board.check_win
				if is_win then
					system("cls")
					game_board.board_out
					io.put_string ("Player " + curr_player.out + " won!!!")
				end

				if game_board.is_board_full then
					io.put_string ("Draw!!!")
					is_win := true
				end

				if curr_player = 1 then
					curr_player := 2
					curr_player_chip := 'X'
				else
					curr_player := 1
					curr_player_chip := 'O'
				end
			end
			io.put_string ("Game is finished!!")
		end

end
