note
	description: "loop_painting application root class"
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
		do
			io.put_string ("Input your number: ")
			io.read_integer
			n := io.last_integer
			io.put_new_line

			cnt := 1
			size := 1

			from i := 0
			until i >= n
			loop

				from j := 1
				until j > size
				loop
					io.put_string (cnt.out + " ")
					cnt := cnt + 1
					j := j + 1
				end
				io.put_new_line

				i := i + 1

				if i \\ 2 = 0 then
					size := size + 1
				end
			end

			io.put_new_line

			cnt := 1
			size := 1

			from i := 0
			until i >= n
			loop
				if i = 0 or i = 1 then
					io.put_string("                ")
				end
				if i = 2 or i = 3 then
					io.put_string("              ")
				end
				if i = 4 then
					io.put_string("            ")
				end
				if i = 5 then
					io.put_string("         ")
				end
				if i = 6 or i = 7 then
					io.put_string("      ")
				end
				if i = 8 or i = 9 then
					io.put_string("   ")
				end


				first := cnt + size - 1
				from j := 1
				until j > size
				loop
					io.put_string (first.out + " ")
					cnt := cnt + 1
					first := first - 1
					j := j + 1
				end
				io.put_new_line

				i := i + 1

				if i \\ 2 = 0 then
					size := size + 1
				end
			end

		end
		n, i, j, cnt, first, size: INTEGER
end
