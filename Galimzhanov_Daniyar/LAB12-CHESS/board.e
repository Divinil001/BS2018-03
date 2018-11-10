note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

create
	create_board

feature
	array2d:ARRAY2[CHESS_PIECE]
	empty_space:EMPTY_PIECE

feature
	create_board(name1:STRING;name2:STRING)
		--creation procedure
		do
			create empty_space.make_empty
			create array2d.make_filled (empty_space, 8, 8)
			fill_board
			io.new_line
			print(" -------------------------------------------%N")
			print("|WARNING:                                   |%N")
			print("|Game is starting                           |%N")
			print("|Capital letters and 1 are white figures    |%N")
			print("|Small letters and 2 are black figures      |%N")
			print("|Point '.' means empty space                |%N")
			print(" -------------------------------------------%N")
			print("       CHESS BOARD%N")

			io.new_line

			show_board

			io.new_line
		end

	move(a_x, a_y, new_x, new_y:INTEGER)
		local
			empty:EMPTY_PIECE
		do
			create empty.make_empty

			if array2d[a_x, a_y].can_move (new_x, new_y) and is_valid_move (a_x, a_y, new_x, new_y) then
				array2d[a_x, a_y].set_x (new_x)
				array2d[a_x, a_y].set_y (new_y)
				array2d[new_x, new_y] := array2d[a_x, a_y]
				array2d[a_x, a_y] := empty
			end



		end


	show_board
		--show the current state of board
		local
			i:INTEGER
			J:INTEGER
		do
			print("         --------%N")
			from i:=1 until i>array2d.width loop
				print("        |")
				from j:=1 until j>array2d.width loop
					print(array2d[i,j].figure)
					j:=j+1
				end
				print("|")
				io.new_line
				i:=i+1
			end
			print("         --------%N")
		end

feature{BOARD}
	form_white_pawns
		-- adding white pawns to board
		local
			i:INTEGER
			pawn_white:PAWN
		do
			from i:=1 until i>array2d.width loop
				create pawn_white.create_pawn (1)
				array2d[2,i]:=pawn_white
				pawn_white.assign_coordinates(2, i)
				i:=i+1
			end
		end


	form_black_pawns
		--adding black pawns to board
		local
			i:INTEGER
			pawn_black:PAWN
		do
			from i:=1 until i>array2d.width loop
				create pawn_black.create_pawn (2)
				array2d[7,i]:=pawn_black
				pawn_black.assign_coordinates(7, i)
				i:=i+1
			end
		end


	is_valid_move(a_x, a_y, new_x, new_y:INTEGER):BOOLEAN
		local
			flag:BOOLEAN
			empty:EMPTY_PIECE
			i:INTEGER
			j:INTEGER
		do
			create empty.make_empty
			if array2d[a_x, a_y].figure = '1' or array2d[a_x, a_y].figure = '2'  then
				if (new_y = a_y and array2d[a_x, a_y].can_move (new_x, new_y) and array2d[new_x, new_y].is_empty) then
					Result:=true
				elseif array2d[new_x, new_y].not_same (array2d[a_x, a_y]) and array2d[new_x, new_y].not_empty then
					Result:=True
				else
					Result:=False
				end
			elseif array2d[new_x, new_y].figure = '.' or array2d[new_x, new_y].not_same (array2d[a_x, a_y])  then
				if (a_x - new_x).abs = (a_y - new_y).abs then
							i:=a_x
							j:=a_y
					from until flag=True or (i = new_x and j = new_y) loop

						if a_x < new_x and a_y < new_y  then
							i:=i+1
							j:=j+1

						elseif a_x > new_x and a_y > new_y  then
							i:=i-1
							j:=j-1
						end

						if array2d[i,j].figure /= empty.figure  then
							flag:=True
							Result:=False
						end

						if array2d[a_x, a_y].not_same (array2d[new_x, new_y]) then
							Result:=true
						else
							Result:=false
						end



					end


				elseif a_x = new_x then


					from j:=a_y until j = new_y or flag=True loop

						i := a_x
						if a_y < new_y then
							j:=j + 1
						elseif a_y > new_y then
							j:=j - 1
						end

						if array2d[a_x, a_y].not_same (array2d[new_x, new_y]) then
							Result:=true
						else
							Result:=false
						end

						if array2d[i, j].figure /= empty.figure then
							flag:=True
							Result:=False

						end

					end
				elseif a_y = new_y then
					j:=a_y
					from i:=a_x until i = new_x or flag=true loop

						if a_x > new_x then
							i:=i-1
						elseif a_x < new_y then
							i:=i+1
						end

						if array2d[a_x, a_y].not_same (array2d[new_x, new_y]) then
							Result:=true
						else
							Result:=false
						end

						if array2d[i, j].figure /= empty.figure then
							flag:=True
							Result:=False
						end



					end
				else
					Result:=True

				end

			else
				print("It is imposibble%N")
				Result:= false
			end



		end




	fill_board
		--filling board by chess pieces
		local
			king:KING
			queen:QUEEN
			bishop:BISHOP
			bishop2:BISHOP
			knight:KNIGHT
			knight2:KNIGHT
			rook:ROOK
			rook2:ROOK
		do
			-------------------------------------
			form_white_pawns -- added white pawns
			form_black_pawns -- added black pawns
			-------------------------------------
			--KING
			create king.create_king (1)
			array2d[1, 5] := king

			king.set_x (1)
			king.set_y (5)
			create king.create_king (2)
			array2d[8, 5] := king
			king.set_x (8)
			king.set_y (5)
			--------------------------------------
			--QUEEN
			create queen.create_queen(1)
			array2d[1, 4] := queen
			queen.set_x (1)
			queen.set_y (4)

			create queen.create_queen(2)
			array2d[8, 4] := queen
			queen.set_x (8)
			queen.set_y (4)
			--------------------------------------
			--BISHOP
			create bishop.create_bishop (1)
			array2d[1, 3] := bishop
			bishop.set_x (1)
			bishop.set_y (3)
			create bishop2.create_bishop (1)
			array2d[1, 6] := bishop2
			bishop2.set_x (1)
			bishop2.set_y (6)
			create bishop.create_bishop (2)
			array2d[8, 3] := bishop
			bishop.set_x (8)
			bishop.set_y (3)
			create bishop2.create_bishop (2)
			array2d[8, 6] := bishop2
			bishop2.set_x (8)
			bishop2.set_y (6)

			--------------------------------------
			--KNIGHT
			create knight.create_knight(1)
			array2d[1, 2] := knight
			knight.set_x (1)
			knight.set_y (2)
			create knight2.create_knight(1)
			array2d[1, 7] := knight2
			knight2.set_x (1)
			knight2.set_y (7)
			create knight.create_knight(2)
			array2d[8, 2] := knight
			knight.set_x (8)
			knight.set_y (2)
			create knight2.create_knight(2)
			array2d[8, 7] := knight2
			knight2.set_x (8)
			knight2.set_y (7)
			--------------------------------------
			--ROOK
			create rook.create_rook(1)
			array2d[1,1] := rook
			rook.set_x (1)
			rook.set_y (1)
			create rook2.create_rook(1)
			array2d[1,8] := rook2
			rook2.set_x (1)
			rook2.set_y (8)
			create rook.create_rook(2)
			array2d[8,1] := rook
			rook.set_x (8)
			rook.set_y (1)
			create rook2.create_rook(2)
			array2d[8,8] := rook2
			rook2.set_x (8)
			rook2.set_y (8)

		end

is_right_white
	local
		x:INTEGER
		y:INTEGER
		a_x, a_y:INTEGER
	do
		print("Print coordinates of figure%N")
		io.read_integer
		x:=io.last_integer
		io.read_integer
		y:=io.last_integer
		if	array2d[x,y].is_white then
			print("Print coordinates of move%N")
			io.read_integer
			a_x:=io.last_integer
			io.read_integer
			a_y:=io.last_integer
			move(x,y,a_x,a_y)
			if array2d[x,y].not_empty then
				print("This move is imposibble%N")
				is_right_white
			end
			show_board
		else
			print("It is not correct%N")
			print("Choose the right coordinates%N")
			is_right_white
		end
	end


is_right_black
	local
		x:INTEGER
		y:INTEGER
		a_x, a_y:INTEGER
	do

		print("Print coordinates of figure%N")
		io.read_integer
		x:=io.last_integer
		io.read_integer
		y:=io.last_integer
		if array2d[x,y].is_black then
			print("Print coordinates of move%N")
			io.read_integer
			a_x:=io.last_integer
			io.read_integer
			a_y:=io.last_integer
			move(x,y,a_x,a_y)
			if array2d[x,y].not_empty then
				print("This move is imposibble%N")
				is_right_black
			end
			show_board
		else
			print("It is not correct%N")
			print("Choose the right coordinates%N")
			is_right_black
		end
	end


feature
	game
		local
			flag:BOOLEAN
		do
			from until flag = TRUE loop
				print("Turn of white figures%N")
				is_right_white
				print("Turn of black figures%N")
				is_right_black
			end
		end

end
