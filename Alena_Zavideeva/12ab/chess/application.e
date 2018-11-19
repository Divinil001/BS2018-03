class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature

	make
		local
			app: CHESS_BOARD
		do
			create app.make
			app.board [2, 3] := create {KNIGHT}.make ("white", create {POSITION}.make (2,3))
			app.print_board
			app.move_piece(create {POSITION}.make (2,3), create {POSITION}.make (4,4))
			app.print_board
			
		end

end
