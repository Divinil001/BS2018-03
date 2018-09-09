note
	description: "connect_four application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	Field : ARRAYED_LIST[ARRAYED_LIST[INTEGER]]
	m,n:INTEGER --m-columns, n-rows
	i, j, inp, k:INTEGER

	turns_count:INTEGER

	pl1, pl2:PLAYER

	turn:INTEGER

	is_end:BOOLEAN

	error:STRING

	make
			-- Run application.
		do
			--| Add your code here
			initialize

			from
				k:=1
			until
				is_end = TRUE
			loop
				print("TURN " + turns_count.out + " " + "PLAYER " + turn.out + " please input column...")


				Io.read_integer_32
				inp:=Io.last_integer_32

				add_new_point(inp)

				if is_end /= TRUE then
					clear_screen
					print_field
					print(error)
					change_turn
					error := ""
					k:= k + 1
				end




			end

			print_field
		end

	change_turn
	do
		if turn = pl1.id then
			turn := pl2.id
		else
			turn := pl1.id
		end
	end

	add_new_point(in:INTEGER)
	local
		can_add:BOOLEAN
	do
		turns_count:=turns_count + 1
		--check for correct input
		if (in > m or in < 0) then
			print("Incorrect column");
			error := "Incorrect column" + "%N"
			can_add := FALSE
			--change turn here bcs in loop we got change again, change+change == the same turn
			change_turn
			turns_count := turns_count - 1
		else
			can_add:=TRUE
		end

		from
			i:=n
		until
			can_add /= TRUE
		loop
			if(i = 0) then
				can_add := FALSE
				print("Column is full, choose another one!");
				error := "Column is full, choose another one!"+ "%N"
				--change turn here bcs in loop we got change again, change+change == the same turn
				change_turn
				turns_count := turns_count - 1
			else
				if (Field.at(in).at(i) = 0 and i > 0) then
					can_add := FALSE
					Field.at(in).put_i_th (turn, i)
					checkend (in, i)
				end
			end
			i:= i - 1
		end
	end

	initialize
	local
		local_arr:ARRAYED_LIST[INTEGER]
	do
		print("Enter count of columns...%N")
		Io.read_integer_32
		m:=Io.last_integer_32
		print("Enter count of rows...%N")
		Io.read_integer_32
		n:=Io.last_integer_32

		turns_count := 1
		error := ""

		create Field.make(n)

		-----------------------------------------
		from
			i:=1
		until
			i >= m + 1
		loop
			create local_arr.make(m)

			from
				j:=1
			until
				j >= n + 1
			loop
				local_arr.extend (0)
				j:=j + 1
			end

			Field.extend(local_arr)
			i:= i + 1
		end

		create pl1.create_player(1)
		create pl2.create_player(2)

		is_end := FALSE

		turn:=pl1.ID

		print_field
	end

	clear_screen
	do
		from
			i:=1
		until
			i >= 25
		loop
			print("%N")
			i:=i+1
		end
	end

	print_field
	do

		from
			i:=1
		until
			i >= n + 1
		loop
			from
				j:= 1
			until
				j >= m + 1
			loop

				print(Field.at(j).at(i).out + " ")

				j:= j + 1
			end
			print("%N")
			i:= i + 1
		end
	end

	checkEnd(x:INTEGER; y:INTEGER)
	local
		count:INTEGER
		xx:INTEGER
		yy:INTEGER
		can_continue:BOOLEAN
	do
		can_continue := TRUE
		count := 1
		xx:=0
		yy:=0

		--horizontal

		--right
		from
			xx:=x + 1
		until
			xx = m + 1
		loop
			if Field[xx][y] = turn then
				count := count + 1
				xx := xx + 1
			else
				xx := m + 1
			end
		end


		--left
		from
			xx:=x - 1
		until
			xx = 0
		loop
			if Field[xx][y] = turn then
				count := count + 1
				xx := xx - 1
			else
				xx := 0
			end
		end

		if count = 4 then
			clear_screen
			print("END OF GAME " + turn.out + " player won!!!%N")
			is_end := TRUE
		end
		count := 1
		---------------------------------------------------------
		--vertical
		--up
		print("123")
		from
			yy:=y - 1
		until
			yy = 0
		loop
			if Field[x][yy] = turn then
				count := count + 1
				yy := yy - 1
			else
				yy := 0
			end
		end


		--down

		from
			yy:=y + 1
		until
			yy = n + 1
		loop
			if Field[x][yy] = turn then
				count := count + 1
				yy := yy + 1
			else
				yy := n + 1
			end
		end

		if count = 4 then
			clear_screen
			print("END OF GAME " + turn.out + " player won!!!%N")
			is_end := TRUE
		end
		count := 1

		---------------------------------------------------------
		--main diag
		--right

		xx := x
		yy := y

		from
			i:=0
		until
			can_continue = FALSE
		loop
			xx := xx + 1
			yy := yy + 1

			if(xx <= m and yy <= n) then
				if(Field[xx][yy] = turn) then
					count:=count + 1
				end
			else
				can_continue := FALSE
			end
		end

		--left

		can_continue := TRUE
		xx := x
		yy := y

		from
			i:=0
		until
			can_continue = FALSE
		loop
			xx := xx - 1
			yy := yy - 1

			if(xx > 0 and yy > 0) then
				if(Field[xx][yy] = turn) then
					count:= count + 1
				end
			else
				can_continue := FALSE
			end
		end

		if count = 4 then
			clear_screen
			print("END OF GAME " + turn.out + " player won!!!%N")
			is_end := TRUE
		end
		count := 1

		---------------------------------------------------------
		--secondary diag
		--right

		xx := x
		yy := y

		from
			i:=0
		until
			can_continue = FALSE
		loop
			xx := xx + 1
			yy := yy - 1

			if(xx <= m and yy > 0) then
				if(Field[xx][yy] = turn) then
					count:=count + 1
				end
			else
				can_continue := FALSE
			end
		end

		--right

		can_continue := TRUE
		xx := x
		yy := y

		from
			i:=0
		until
			can_continue = FALSE
		loop
			xx := xx - 1
			yy := yy + 1

			if(xx > 0 and yy <= n) then
				if(Field[xx][yy] = turn) then
					count:= count + 1
				end
			else
				can_continue := FALSE
			end
		end

		if count = 4 then
			clear_screen
			print("END OF GAME " + turn.out + " player won!!!%N")
			is_end := TRUE
		end

	end

end
