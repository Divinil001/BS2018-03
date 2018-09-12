note
	description: "connect_four application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	m,n, column, empty, one, it:INTEGER
	player:BOOLEAN
	ended, is_win : BOOLEAN
	board:BOARD
	player_number, current_player:INTEGER
	make
			-- Run application.
			local k:INTEGER

		do
			--| Add your code here
			print("Rows : ")
			io.read_integer
			m := io.last_integer
			print("Columns : ")
			io.read_integer
			n := io.last_integer
			create board.make(m,n)

			current_player := 1
			player_number := 1

			is_win:=FALSE



			from
				k := 0
			until
				is_win
			loop
				system("cls")

				board.board_out

				print("Player " + current_player.out + " turn ")
				io.read_integer
				board.make_turn (m,io.last_integer, player_number,current_player)
				is_win := board.check_win
				if is_win then
					system("cls")
					board.board_out
					print("Player " + current_player.out + " won!!!")
				end

				if board.is_board_full then
					io.put_string ("Draw!!!")
					is_win := true
				end

				if current_player = 1 then
					current_player := 2
					player_number := 2
				else
					current_player := 1
					player_number := 1
				end
			end
			print ("Game is finished!!")
		end

		end--class end



