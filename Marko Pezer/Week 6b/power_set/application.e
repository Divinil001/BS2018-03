note
	description: "PowerSet application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	a, b: ARRAY[INTEGER]

	make
	local
		do
			io.put_string ("A = {123}%N")
			io.put_string ("B = {1234}%N%N")

			a := <<1, 2, 3>>
			io.put_string ("A subsets: %N")
			power_set("", 0, a)
			io.put_new_line
			io.put_new_line

			b := <<1, 2, 3, 4>>
			io.put_string ("B subsets: %N")
			power_set("", 0, b)
			io.put_new_line
		end

	power_set (s: STRING; pos: INTEGER; arr: ARRAY[INTEGER])
	require
		position: pos >= 0
		array: arr.count > 0
	local
		i: INTEGER
	do
		io.put_string ("{" + s + "} ")

		if pos < arr.count then
			from i := pos + 1
			until i > arr.count
			loop
				power_set ((s + arr[i].out), i, arr)
				i := i + 1
			end
		end
	end

end
