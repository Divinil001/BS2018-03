note
	description: "Summary description for {CHESS_BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CHESS_BOARD
create
	make

feature
	board: ARRAY2[CELLS]

feature
	make
		local
			white, black,non: CELLS
			i,j:INTEGER
		do
			create non.make ("X")
			create board.make_filled (non,8,8)

			from
				i:=1
			until
				i>8
			loop
				from
					j:=1
				until
					j>8
				loop
					if
						(i\\2=1 and j\\2=0) or (i\\2=0 and j\\2=1)
					then
						create black.make ("1")
						board[i,j]:=black
					elseif
						(i\\2=1 and j\\2=1) or (i\\2=0 and j\\2=0)
					then
						create white.make ("0")
						board[i,j]:=white
					end
					j:=j+1
				end
				i:=i+1
			end

		end

	chess_board
		local
			i,j: INTEGER
		do
			from
				i:=1
			until
				i>8
			loop
				from
					j:=1
				until
					j>8
				loop
					print(board[i,j].name.out)
					print(" ")
					if
						j=8
					then
						io.new_line
					end
					j:=j+1
				end
				i:=i+1
			end
		end

	can_move(x1,y1,x2,y2: INTEGER): BOOLEAN
		do
			if
				attached board[x1,y1].piece as piece		-- не пустую(attached) ячейку обозначить как piece
			then
				if
					piece.name~"k"
				then
					if
						(piece.can_move(x2,y2)=True and board[x2,y2].piece=Void) or (piece.can_move(x2,y2)=True and opposite_colour(x1,y1,x2,y2)=True)
					then
						Result:=True
					else
						Result:=False
					end
				else
					if
						piece.can_move (x2,y2)=True and search(x1,y1,x2,y2)=False and (board[x2,y2].piece=Void or opposite_colour(x1,y1,x2,y2)=True)
					then
						Result:=True
					else
						Result:=False
					end
				end
			end
		end

	move_piece(x1,y1,x2,y2: INTEGER)
		local
			white, black: CELLS
		do
			if
				attached board[x1,y1].piece as piece1
			then
				if
					can_move(x1,y1,x2,y2)=True
				then
					piece1.move(x2,y2)
					board[x2,y2]:=board[x1,y1]
					if
						(x1\\2=1 and y1\\2=1) or (x1\\2=0 and y1\\2=0)
					then
						create white.make ("0")
						board[x1,y1]:=white
					else
						create black.make ("1")
						board[x1,y1]:=black
					end
				end
			end
		end

	search(p_x1,p_y1,p_x2,p_y2: INTEGER): BOOLEAN
		local
			step_x, step_y, x1,y1,x2,y2: INTEGER
		do
			x1:=p_x1
			y1:=p_y1
			x2:=p_x2
			y2:=p_y2
			step_x:=(x2-x1)//(x2-x1).abs
			step_y:=(y2-y1)//(y2-y1).abs
			Result:=False
			from

			until
				x1=x2 and y1=y2
			loop
				if
					board[x1+step_x, y1+step_y].piece/= Void
				then
					Result:=True
				end

				x1:=x1+step_x
				y1:=y1+step_y
			end
		end

		opposite_colour(x1,y1,x2,y2: INTEGER): BOOLEAN
			do
				if
					attached board[x1,y1].piece as piece1 and attached board[x2,y2].piece as piece2
				then
					if
						piece1.colour/=piece2.colour
					then
						Result:=True
					else
						Result:=False
					end
				end
			end

end
