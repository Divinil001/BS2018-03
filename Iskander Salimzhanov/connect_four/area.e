note
	description: "Summary description for {AREA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	AREA
create
	fill_in
feature {NONE}
	fill_in(a_n: INTEGER; a_m: INTEGER)
		do
			set_n(a_n)
			set_m(a_m)
			set_field(a_n, a_m)
		end
feature
	n: INTEGER
	m: INTEGER
	field: ARRAY2 [INTEGER]
feature
	set_n(nn: INTEGER)
	do
		n := nn
	end
	set_m(mm: INTEGER)
	do
		m := mm
	end
	set_field(nn: INTEGER; mm: INTEGER)
	do
		create field.make_filled (0, nn, mm)
	end
feature
	find(a_col: INTEGER): INTEGER
	local
		i: INTEGER
	do
		Result := -1
		from
			i := n
		until
			i = 0
		loop
			print("%N")
			if field.item (i, a_col) = 0 then
				Result := i
				i := 0
			else
				i := i - 1
			end
		end
	end

	printf
	local
		i: INTEGER
		j: INTEGER
	do
		from
			i := 1
		until
			i > n
		loop
			from
				j := 1
			until
				j > m
			loop
				print(field.item (i, j))
				print(" ")
				j := j + 1
			end
			print("%N")
			i := i +1
		end
	end

	check_position(a_x: INTEGER; a_y: INTEGER): BOOLEAN
	do
		Result := a_x >= 1 and a_x <= n and a_y >= 1 and a_y <= m
	end

	turn(a_player: PLAYER)
	local
		u: BOOLEAN
		x: INTEGER
		y: INTEGER
		cnt: INTEGER
	do
		current.printf
		io.new_line
		from
			u := FALSE
			cnt := 0
		until u = TRUE loop
			print(a_player.name + ", type column: ")
			io.read_integer
			y := io.last_integer
			x := find(y)
			if check_position(x, y) and field.item (x, y) = 0 then
				u := TRUE
				field.item (x, y) := a_player.color
			else
				print("Incorect data" + "%N")
			end
		end
	end

	end_game_check: BOOLEAN
	local
		i: INTEGER
		j: INTEGER
		x: INTEGER
		last: INTEGER
		cnt: INTEGER
	do
		from
			i := 1
		until
			i > n
		loop
			from
				j := 1
				last := 0
			until
				j > m
			loop
				if field.item (i, j) /= 0 and field.item (i, j) = last then
					cnt := cnt + 1
				else
					last := field.item (i, j)
					cnt := 1
				end
				if cnt = 4 then
					Result := TRUE
				end
				j := j + 1
			end
			i := i + 1
		end

		from
			i := 1
		until
			i > m
		loop
			from
				j := 1
				last := 0
			until
				j > n
			loop
				if field.item (j, i) /= 0 and field.item (j, i) = last then
					cnt := cnt + 1
				else
					last := field.item (j, i)
					cnt := 1
				end
				if cnt = 4 then
					Result := TRUE
				end
				j := j + 1
			end
			i := i + 1
		end

		from
			x := 1
		until
			x > m
		loop
			from
				i := 1
				j := x
			until
				not current.check_position (i, j)
			loop
				if field.item (j, i) /= 0 and field.item (j, i) = last then
					cnt := cnt + 1
				else
					last := field.item (j, i)
					cnt := 1
				end
				if cnt = 4 then
					Result := TRUE
				end
				i := i + 1
				j := j + 1
			end
			x := x + 1
		end

		from
			x := 1
		until
			x > n
		loop
			from
				i := x
				j := 1
			until
				not current.check_position (i, j)
			loop
				if field.item (j, i) /= 0 and field.item (j, i) = last then
					cnt := cnt + 1
				else
					last := field.item (j, i)
					cnt := 1
				end
				if cnt = 4 then
					Result := TRUE
				end
				i := i + 1
				j := j + 1
			end
			x := x + 1
		end

		from
			x := 1
		until
			x > m
		loop
			from
				i := n
				j := x
			until
				not current.check_position (i, j)
			loop
				if field.item (j, i) /= 0 and field.item (j, i) = last then
					cnt := cnt + 1
				else
					last := field.item (j, i)
					cnt := 1
				end
				if cnt = 4 then
					Result := TRUE
				end
				i := i - 1
				j := j + 1
			end
			x := x + 1
		end

		from
			x := 1
		until
			x > n
		loop
			from
				i := x
				j := m
			until
				not current.check_position (i, j)
			loop
				if field.item (j, i) /= 0 and field.item (j, i) = last then
					cnt := cnt + 1
				else
					last := field.item (j, i)
					cnt := 1
				end
				if cnt = 4 then
					Result := TRUE
				end
				i := i - 1
				j := j + 1
			end
			x := x + 1
		end
		from
			x := 1
		until
			x > n
		loop
			from
				i := x
				j := 1
			until
				not current.check_position (i, j)
			loop
				if field.item (j, i) /= 0 and field.item (j, i) = last then
					cnt := cnt + 1
				else
					last := field.item (j, i)
					cnt := 1
				end
				if cnt = 4 then
					Result := TRUE
				end
				i := i + 1
				j := j + 1
			end
			x := x + 1
		end
	end
end
