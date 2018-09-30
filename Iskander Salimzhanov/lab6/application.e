note
	description: "lab6 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32
	DOUBLE_MATH

create
	make

feature
	power_set(a: ARRAYED_LIST [INTEGER])
	require
		set_is_not_empty: a /= Void
	local
		i: INTEGER
		j: INTEGER
		g: INTEGER
	do
		from
			i := 1
		until
			i > a.count
		loop
			from
				j := i
			until
				j > a.count
			loop
				from
					g := i
				until
					g > j
				loop
					print(a.i_th (g))
					print(" ")
					g := g + 1
				end
				print("%N")
				j := j + 1
			end
			i := i + 1
		end
	end

feature
	hanoi_tower_solving(n: INTEGER): INTEGER
	require
		valid_n: n >= 1
		overflow: n <= 32
	local
		i: INTEGER
	do
		Result := 1
		from
			i := 1
		until
			i > n
		loop
			Result := Result * 2
			i := i + 1
		end
		Result := Result - 1
	end

feature
	array: ARRAY2 [BOOLEAN]
	dp: ARRAY2 [INTEGER]
	inf, r, c: INTEGER
	number_of_limits: INTEGER

	check_position(x, y: INTEGER): BOOLEAN
	do
		Result := x >= 1 and then x <= r and then y >= 1 and then y <= c
		if Result then
			Result := Result and array.item (x, y)
		end
	end

	robot(a, b: INTEGER): INTEGER
	require
		valid_position: check_position(a, b)
	local
		res: INTEGER
	do
		print(a)
		print(" ")
		print(b)
		print("%N")
		if a = r and b = c then
			dp.item (a, b) := 0
			Result := 0
		else
			res := dp.item(a, b)
			if res /= inf then
				Result := res
			else
				res := -inf
				if check_position(a, b + 1) then
					res := res.max (robot(a, b + 1) + 1)
				end
				if check_position(a + 1, b) then
					res := res.max (robot(a + 1, b) + 1)
				end
				dp.item(a, b) := res
				Result := res
			end
		end
	ensure
		Result /= inf
	end

	robot_execution
	local
		i: INTEGER
		x: INTEGER
		y: INTEGER
	do
		inf := 1000 * 1000 * 1000
		io.read_integer
		r := io.last_integer
		io.read_integer
		c := io.last_integer
		io.read_integer
		number_of_limits := io.last_integer
		array.make_filled (True, r, c)
		dp.make_filled (inf, r, c)
		from
			i := 1
		until
			i > number_of_limits
		loop
			io.read_integer
			x := io.last_integer
			io.read_integer
			y := io.last_integer
			if not (x = 1 and y = 1) and check_position(x, y) then
				array.item (x, y) := False
			end
			i := i + 1
		end
		print(robot(1, 1))
	end


feature {NONE} -- Initialization

	make
		local
			n: INTEGER
			-- Run application.
		do
			create array.make_filled (false, 1, 1)
			create dp.make_filled (1, 1, 1)
			--robot_execution
			n := 3
			print(hanoi_tower_solving(n))
		end

end
