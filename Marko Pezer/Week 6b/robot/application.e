note
	description: "robot application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	ans: STRING
	a, b: ARRAY2[INTEGER]

	make
	do
		ans := ""
		create a.make_filled (0, 5, 5)
		create b.make_filled (10000, 5, 5)

		a.item (2, 1) := 1
		a.item (3, 1) := 1
		a.item (2, 2) := 1
		a.item (1, 4) := 1
		a.item (2, 4) := 1
		a.item (4, 4) := 1

		io.put_string ("Matrix: %N%N")
		print_matrix (a, 5, 5)

		flood_fill(5, 5, 1, 1, 0)
		get_path (5, 5)

		io.put_string ("Path: %N")
		io.put_string (ans)
		io.put_new_line

	end

	flood_fill (n, m, x, y, move: INTEGER)
	require
		always_ok: true
	do
		if (x >= 1 and x <= n and y >= 1 and y <= m and a.item (x, y) = 0 and move < b.item (x, y)) then
			b.item (x, y) := move
			flood_fill (n, m, x + 1, y, move + 1)
			flood_fill (n, m, x, y + 1, move + 1)
		end
	end

	print_matrix (m: ARRAY2[INTEGER]; x, y: INTEGER)
	local
		i, j: INTEGER
	do
		from i := 1
		until i > x
		loop
			from j := 1
			until j > y
			loop
				if m.item (i, j) = 1 then
					io.put_character ('#')
				else
					io.put_character ('.')
				end
				j := j + 1
			end
			io.put_new_line
			i := i + 1
		end
		io.put_new_line
	end

	get_path (x, y: INTEGER)
	do
		ans.prepend ("{" + x.out + "," + y.out + "} ")
		if (x >= 1 and y >= 1) then
			if x - 1 >= 1 and b.item (x - 1, y) = b.item (x, y) - 1 then
				get_path (x - 1, y)
			elseif y - 1 >= 1 and b.item (x, y - 1) = b.item (x, y) - 1 then
				get_path (x, y - 1)
			end
		end
	end

end
