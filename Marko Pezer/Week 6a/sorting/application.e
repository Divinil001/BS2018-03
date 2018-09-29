note
	description: "sorting application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	arr, sarr: ARRAY[INTEGER]
	sort_my_array: SORT_ARRAY
	i, n: INTEGER

	make
		do
			create arr.make_filled (0, 1, 5)
			arr.item(1) := 4
			arr.item(2) := 1
			arr.item(3) := 2
			arr.item(4) := 5
			arr.item(5) := 3

			create sort_my_array.make
			n := arr.count

			io.put_string ("Array: ")
			from i := 1
			until i > n
			loop
				io.put_string (arr.item(i).out + " ")
				i := i + 1
			end
			io.put_new_line

			sarr := sort_my_array.sort_arr (arr, n)

			io.put_string ("Sorted Array: ")
			from i := 1
			until i > n
			loop
				io.put_string (sarr.item(i).out + " ")
				i := i + 1
			end
			io.put_new_line

		end
end
