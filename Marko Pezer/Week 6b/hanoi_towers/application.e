note
	description: "hanoi_towers application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
	local
		x: INTEGER
	do
		io.put_string ("Input number of disks: ")
		io.read_integer
		x := io.last_integer

		io.put_new_line
		io.put_string ("Moves: %N%N")
		hanoi (x, 'A', 'B', 'C')
	end

	hanoi (n: INTEGER; a, b, c: CHARACTER)
	require
		non_negative: n >= 0
		different1: a /= b
		different2: a /= c
		different3: b /= c
	do
		if n > 0 then
			hanoi (n - 1, a, c, b)
			move (a, b)
			hanoi (n - 1, c, b, a)
		end
	end

	move (a, b: CHARACTER)
	require
		different: a /= b
	do
		io.put_character (a)
		io.put_string (" -> ")
		io.put_character (b)
		io.put_new_line
	end

end
