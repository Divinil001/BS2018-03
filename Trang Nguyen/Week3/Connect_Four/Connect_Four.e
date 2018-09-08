note
	description: "ConnectFour application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			enter_size
			blank_board
			print_board
			create signal.make_empty
			set_signal ("1")
			playing
		end

feature -- Access

	signal: STRING_8
			-- `signal'
		attribute check False then end end --| Remove line when `signal' is initialized in creation procedure.

feature -- Element change

	set_signal (a_signal: like signal)
			-- Assign `signal' with `a_signal'.
		do
			signal := a_signal
		ensure
			signal_assigned: signal = a_signal
		end

feature

	board: ARRAYED_LIST [ARRAYED_LIST [STRING_8]]
			-- Data of game
		attribute check False then end end --| Remove line when `board' is initialized in creation procedure.

	row: INTEGER_32
			-- Number of rows of board

	col: INTEGER_32
			-- Number of colums of board

	blank_board
			-- Create a blank board data
		local
			row_list: ARRAYED_LIST [STRING_8]
			i, j: INTEGER
		do
			create board.make (row)
			from i := 1
			until i > row
			loop
				create row_list.make (col)
				from j := 1
				until j > col
				loop
					row_list.extend (" ")
					j := j + 1
				end
				board.extend (row_list)
				i := i + 1
			end
		end

	print_board
			-- Print play board
		local
			i, j: INTEGER
			border: STRING
		do	io.new_line
			border := "-"
			border.multiply (col * 2 + 1)
			from i := 1
			until i > row
			loop
				print (border)
				io.new_line
				from j := 1
				until j > col
				loop
					print ("|" + board.i_th (i).i_th (j))
					j := j + 1
				end
				print ("|")
				io.new_line
				i := i + 1
			end
			print (border)
			io.new_line
			from i := 1
			until i > col
			loop
				print (" " + i.out)
				i := i + 1
			end
			io.new_line
		end


	enter_size
			-- Enter size of board from keyboard
		local
			invalid: BOOLEAN
			num_enter: INTEGER
		do
			from invalid := True
			until invalid = False
			loop
				io.new_line
				print ("Enter number of rows: ")
				io.new_line
				io.read_line
				if io.last_string.is_integer then
					num_enter := io.last_string.to_integer
					if num_enter >= 4 then
						row := num_enter
						invalid := False
					end
				end
			end

			from invalid := True
			until invalid = False
			loop
				io.new_line
				print ("Enter number of colums: ")
				io.new_line
				io.read_line
				if io.last_string.is_integer then
					num_enter := io.last_string.to_integer
					if num_enter >= 4 then
						col := num_enter
						invalid := False
					end
				end
			end
			io.new_line
		end

	col_chosen: INTEGER
			-- col_chosen

	row_chosen: INTEGER
			-- row_chosen

	is_valid_move (k: INTEGER_32): BOOLEAN
			-- `is_valid_move'
		do
			if k <= col and k >= 1 and board.i_th (1).i_th (k).is_equal (" ") then Result := True
			else Result := False
			end
		end

	choose
			-- Choose colum to drop token
		local
			invalid: BOOLEAN
			i: INTEGER
		do
			from invalid := True
			until invalid = False
			loop
				print ("Player" + signal + " choose colum: ")
				io.new_line
				io.read_line
				if io.last_string.is_integer then
					col_chosen := io.last_string.to_integer
					if is_valid_move (col_chosen) then
							from i := row
							until i = 0
							loop
								if board.i_th (i).i_th (col_chosen).is_equal (" ") then
									board.i_th (i).put_i_th (signal, col_chosen)
									row_chosen := i
									i := 0
								else i := i - 1
								end
							end
							invalid := False
					end
				end
			end
		end

	win: BOOLEAN
			-- Check if player win
		do
			Result := (win_col (row_chosen, col_chosen) or win_row (row_chosen, col_chosen) or win_left (row_chosen, col_chosen) or win_right (row_chosen, col_chosen))
		end

	win_col (i: INTEGER_32; j: INTEGER_32): BOOLEAN
			-- Check vertically from element ij down
		local
			end_point, count, e: INTEGER
		do
			if i + 3 <= row then
				end_point := i + 3
				count := 0
				from e := i
				until e > end_point
				loop
					if board.i_th (e).i_th (j).is_equal (signal) then
						count := count + 1
					else count := 0
					end
					e := e + 1
				end
				if count = 4 then
					Result := True
				else
					Result := False
				end
			else Result := False
			end
		end

	win_row (i: INTEGER_32; j: INTEGER_32): BOOLEAN
			-- Check in row from element ij
		local
			start_point, end_point, count, e: INTEGER
		do
			if j > 3 then start_point := j - 3
			else start_point := 1
			end
			if j < col - 3 then end_point := j + 3
			else end_point := col
			end
			count := 0
			from e := start_point
			until e > end_point
			loop
				if board.i_th (i).i_th (e).is_equal (signal) then
					count := count + 1
				else count := 0
				end
				e := e + 1
			end
			if count = 4 then Result := True
			else Result := False
			end
		end

	win_left (i: INTEGER_32; j: INTEGER_32): BOOLEAN
			-- Check left down from element ij
		local
			count, e: INTEGER
		do
			if i + 3 <= row and j >= 4 then
				count := 1
				from e := 1
				until e = 4
				loop
					if board.i_th (i + e).i_th (j - e).is_equal (signal) then
						count := count + 1
						e := e + 1
					else e := 4
					end
				end
				if count = 4 then
					Result := True
				else
					Result := False
				end
			else Result := False
			end
		end

	win_right (i: INTEGER_32; j: INTEGER_32): BOOLEAN
			-- Check right down from element ij
		local
			count, e: INTEGER
		do
			if i + 3 <= row and j <= row -3 then
				count := 1
				from e := 1
				until e = 4
				loop
					if board.i_th (i + e).i_th (j + e).is_equal (signal) then
						count := count + 1
						e := e + 1
					else e := 4
					end
				end
				if count = 4 then
					Result := True
				else
					Result := False
				end
			else Result := False
			end
		end

	playing
			-- `playing'
		local
			is_playing: BOOLEAN
			count: INTEGER
		do
			count := 0
			from is_playing := True
			until is_playing = False
			loop
				io.new_line
				if signal.is_equal ("1") then
					choose
					if win  then
						print ("Player1 wins!")
						is_playing := False
					else set_signal ("2")
					end
				else
					choose
					if win  then
						print ("Player2 wins!")
						is_playing := False
					else set_signal ("1")
					end
				end
				print_board
				count := count + 1
				if count = col * row then
					print ("%NThis game is a tie%N!")
					is_playing := False
				end
			end
		end
end
