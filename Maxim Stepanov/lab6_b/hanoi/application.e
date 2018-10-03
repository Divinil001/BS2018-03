note
	description: "hanoi application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	a, b, c: INTEGER

	make
		do
			hanoi(4, 1, 3, 2)
		end

	hanoi(n: INTEGER src: INTEGER dest: INTEGER help: INTEGER)
	do
		if n = 1 then
			print("%NMove disk from ")
			io.put_integer(src)
			print(" to ")
			io.put_integer(dest)
		else
			hanoi(n - 1, src, help, dest)

			print("%NMove disk from ")
			io.put_integer(src)
			print(" to ")
			io.put_integer(dest)

			hanoi(n - 1, help, dest, src)
		end
	end

end
