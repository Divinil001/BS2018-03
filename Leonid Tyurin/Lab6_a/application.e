note
	description: "string_reverse application root class"
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
			a:STRING
			arr, arr2:ARRAY[INTEGER]
			sort:MERGE_SORT
			i:INTEGER
			l:LCS
			str1,str2:STRING
			str:STRING_REVERSE
		do
			create l
			create str
			str1 := "YIPXOT"
			str2 := "XYUIOP"
		--	print(l.lcs (str1, str2))




			a := "qwerty"
--			print(a.substring (2, a.capacity))
			print(str.reverse_it(a))
			io.new_line
			print(str.reverse_rec (a))
--			io.new_line
--			print(iterative(a))
--			create arr.make_empty
--			create arr2.make_filled (2, 0, 9)
--			create sort
--			arr.force (5, 0)
--			arr.force (1, 1)
--			arr.force (3, 2)
--			arr2[1] := 5
--			arr2[2] := 1
--			arr2[3] := 3
--			from
--				i := 0
--			until
--				i > arr.upper
--			loop
--				print(arr[i].out + "  ")
--				i := i + 1
--			end
--			sort.mergesort (arr, arr.lower, arr.upper)
--			io.new_line
--			from
--				i := 0
--			until
--				i = arr.upper + 1
--			loop
--				print(arr[i].out + "  ")
--				i := i + 1
--			end
		end


end
