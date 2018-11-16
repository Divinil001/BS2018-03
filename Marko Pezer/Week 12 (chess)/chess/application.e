note
	description: "chess application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	ct: CHESS_TABLE
	wrook1: ROOK
	wrook2: ROOK
	bking: KING
	wqueen: QUEEN
	bbishop: BISHOP
	wknight: KNIGHT

	make
	do
		io.put_string ("1 = White pieces%N")
		io.put_string ("2 = Black pieces%N")
		io.put_new_line

		create ct.make

		io.put_string ("Starting position on table: %N")

		io.put_string (" - White Rook 1 on position 2, 2 %N")
		create wrook1.make (true, 2, 2)
		ct.table.put (1, 2, 2)

		io.put_string (" - White Rook 2 on position 5, 2 %N")
		create wrook2.make (true, 5, 2)
		ct.table.put (1, 5, 2)

		io.put_string (" - Black King on position 1, 1 %N")
		create bking.make (false, 1, 1)
		ct.table.put (2, 1, 1)

		io.put_string (" - White Queen on position 6, 8 %N")
		create wqueen.make (true, 6, 8)
		ct.table.put (1, 6, 8)

		io.put_string (" - Black Bishop on position 4, 5 %N")
		create bbishop.make (false, 4, 5)
		ct.table.put (2, 4, 5)

		io.put_string (" - White Knight on position 1, 7 %N")
		create wknight.make (true, 1, 7)
		ct.table.put (1, 1, 7)

		io.put_new_line

		ct.print_table

		io.put_string ("Move white rook from 5, 2 to 5, 7... %N")
		wrook2.can_move (5, 7, ct)

		ct.print_table

		io.put_string ("Move black king from 1, 1 to 2, 2... %N")
		bking.can_move (2, 2, ct)

		ct.print_table

		io.put_string ("Move white queen from 6, 8 to 5, 7... %N")
		wqueen.can_move (6, 8, ct)

		ct.print_table

		io.put_string ("Move white queen from 6, 8 to 8, 6... %N")
		wqueen.can_move (8, 6, ct)

		ct.print_table

		io.put_string ("Move black bishop from 4, 5 to 7, 2... %N")
		bbishop.can_move (7, 2, ct)

		ct.print_table

		io.put_string ("Move white knight from 1, 7 to 2, 6... %N")
		wknight.can_move (2, 6, ct)

		ct.print_table

		io.put_string ("Move white knight from 1, 7 to 3, 6... %N")
		wknight.can_move (3, 6, ct)

		ct.print_table

	end

end
