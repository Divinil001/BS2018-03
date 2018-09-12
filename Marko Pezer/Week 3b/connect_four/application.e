note
	description: "connect_four application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

n, m, flag, c, i, j: INTEGER
k: BOOLEAN
name1, name2: STRING
matrix: ARRAY2[INTEGER]

	make
		do
			io.put_string ("Input number of rows in table (greather than 4): ")
			io.read_integer
			n := io.last_integer.twin
			io.put_string ("Input number of columns in table (greather than 4): ")
			io.read_integer
			m := io.last_integer.twin

			io.put_string ("Input Player 1 name: ")
			io.read_line
			name1 := io.last_string.twin

			io.put_string ("Input Player 2 name: ")
			io.read_line
			name2 :=  io.last_string.twin

			io.put_new_line

			create matrix.make_filled (0, n, m)
			flag := 1

			from k := TRUE until k = FALSE
			loop

				io.put_string ("Select the column - ")
				if flag = 1 then
					io.put_string (name1)
				else
					io.put_string (name2)
				end
				io.put_string (": ")

				io.read_integer
				c := io.last_integer.twin

				if matrix.item (1, c) /= 0 then
					io.put_string ("ERROR! The selected column is full.%N")
					-- GOTO ?
					else

						from i := 1 until i > n or matrix.item(i, c) /= 0
						loop
							i := i + 1
						end

						matrix.put (flag, i-1, c)

						--io.put_new_line
						--from i := 1 until i > n
						--loop
						--	from j := 1 until j > m
						--	loop
						--		io.put_string (matrix.item(i, j).out + " ")
						--		j := j + 1
						--	end
						--	io.put_new_line
						--	i := i + 1
						--end

						if is_winner(flag) = true then

							io.put_string ("%NGAME OVER! Winner is: ")
							if flag = 1 then
								io.put_string (name1)
							else
								io.put_string (name2)
							end
							io.put_new_line

							k := FALSE
						end

						if flag = 1 then flag := 2
						else flag := 1

					end

				end

			end


		end

feature

	is_winner (x: INTEGER): BOOLEAN
	local
		win: BOOLEAN
	do

		win := FALSE

		from i := 1 until i > n - 3
		loop
			from j := 1 until j > m
			loop
				if matrix.item(i, j) = x and matrix.item(i + 1, j) = x and matrix.item(i + 2, j) = x and matrix.item(i + 3, j) = x then
					win := TRUE
				end
				j := j + 1
			end
			i := i + 1
		end

		from i := 1 until i > n
		loop
			from j := 1 until j > m - 3
			loop
				if matrix.item(i, j) = x and matrix.item(i, j + 1) = x and matrix.item(i, j + 2) = x and matrix.item(i, j + 3) = x then
					win := TRUE
				end
				j := j + 1
			end
			i := i + 1
		end

		from i := 1 until i > n - 3
		loop
			from j := 1 until j > m - 3
			loop
				if matrix.item(i, j) = x and matrix.item(i + 1, j + 1) = x and matrix.item(i + 2, j + 2) = x and matrix.item(i + 3, j + 3) = x then
					win := TRUE
				end
				j := j + 1
			end
			i := i + 1
		end

		from i := 4 until i > n
		loop
			from j := 1 until j > m - 3
			loop
				if matrix.item(i, j) = x and matrix.item(i - 1, j + 1) = x and matrix.item(i - 2, j + 2) = x and matrix.item(i - 3, j + 3) = x then
					win := TRUE
				end
				j := j + 1
			end
			i := i + 1
		end

		Result := win

	end

end
