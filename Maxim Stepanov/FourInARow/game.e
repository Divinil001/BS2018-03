note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

create
	make

feature

	size: INTEGER

	field: ARRAY2 [INTEGER]

	player1: PLAYER

	player2: PLAYER

	isRunning: BOOLEAN

	make (a_size: INTEGER a_player1: PLAYER a_player2: PLAYER)
		do
			size := a_size
			create field.make_filled (0, size, size)
			player1 := a_player1
			player2 := a_player2
			isRunning := True
		end

	run
		do
			from
			until
				not isRunning
			loop
				processPlayer (player1, 1)
				if isRunning then
					processPlayer (player2, 2)
				end
			end
		end

	processPlayer (p: PLAYER index: INTEGER)
		local
			column: INTEGER
		do
			printField
			print ("%NMake your turn, " + p.name + ". Choose integer: ")
			io.read_integer
			column := io.last_integer
			from
			until
				column >= 1 and column <= size
			loop
				if column < 1 or column > size then
					print ("Invalid column. Choose another.%N")
					io.read_integer
					column := io.last_integer
				end
			end
			maketurn (p, index, column)
		end

	printField
		local
			i, j: INTEGER
		do
			from
				i := 0
			until
				i >= size
			loop
				print ("|")
				from
					j := 0
				until
					j >= size
				loop
					print (field [j + 1, i + 1])
					j := j + 1
				end
				print ("|%N")
				i := i + 1
			end
		end

	findFirstFreeCell (column: INTEGER): INTEGER
		local
			free, i: INTEGER
		do
			free := -1
			from
				i := size
			until
				i <= 0
			loop
				if free = -1 and field [column, i] = 0 then
					free := i
				end
				i := i - 1
			end
			Result := free
		end

	makeTurn (p: PLAYER index: INTEGER column: INTEGER)
		local
			firstFreeCell: INTEGER
		do
			firstFreeCell := findfirstfreecell (column)
			if firstfreecell = -1 then
				print ("This column has no free space. You lose your turn.%N")
			else
				field [column, firstfreecell] := index
				checkPlayer (p, index)
			end
		end

	mcheck
		do
			checkPlayer (player1, 1)
			checkPlayer (player2, 2)
		end

	checkPlayer (player: PLAYER index: INTEGER)
		local
			i: INTEGER
			j: INTEGER
			pos: VECTOR
			d: VECTOR
			good: BOOLEAN
		do
			good := False
			from
				i := 0
			until
				i >= size
			loop
				from
					j := 0
				until
					j >= size
				loop
					create pos.make (i, j)
					if i < size - 3 then
						create d.make (1, 0)
						good := good or checkCell (d, pos, index)
					end
					if i < size - 3 and j < size - 3 then
						create d.make (1, 1)
						good := good or checkCell (d, pos, index)
					end
					if j < size - 3 then
						create d.make (0, 1)
						good := good or checkCell (d, pos, index)
					end
					if i >= 3 and j < size - 3 then
						create d.make (-1, 1)
						good := good or checkCell (d, pos, index)
					end
					j := j + 1
				end
				i := i + 1
			end
			if good then
				print ("Player " + player.name + " won!%N");
				isRunning := False
			end
		end

	checkCell (dir: VECTOR startPos: VECTOR p: INTEGER): BOOLEAN
		local
			pos: VECTOR
			i: INTEGER
			good: BOOLEAN
		do
			good := True
			pos := startPos.mclone
			from
				i := 0
			until
				i >= 4
			loop
				if field [pos.x + 1, pos.y + 1] /= p then
					good := False
				end
				pos.add (dir)
				i := i + 1
			end
			Result := good
		end

end
