class
	APPLICATION
create
	make
feature
	arr: ARRAY2[INTEGER]
	arr2: ARRAY2[INTEGER]
	operator: MATRIX_OPER
	make
		do
			create operator
			create arr.make_filled (1, 5, 5)
			create arr2.make_filled (2, 3, 3)
--			print( operator.add (arr,arr2) )
--			print( operator.minus (arr, arr2) )
--			print( operator.prod (arr, arr2) )
			arr[1, 1] := 1
			arr[1, 2] := 2
			arr[1, 3] := 3
			arr[1, 4] := 4
			arr[1, 5] := 4

			arr[2, 1] := -4
			arr[2, 2] := -5
			arr[2, 3] := 7
			arr[2, 4] := 6
			arr[2, 5] := 6

			arr[3, 1] := -2
			arr[3, 2] := -4
			arr[3, 3] := -3
			arr[3, 4] := 4
			arr[3, 5] := 4

			arr[4, 1] := 7
			arr[4, 2] := 2
			arr[4, 3] := 6
			arr[4, 4] := -4
			arr[4, 5] := -4

			arr[5, 1] := 5
			arr[5, 2] := -5
			arr[5, 3] := 4
			arr[5, 4] := -9
			arr[5, 5] := 3
-----------------------------------------
--			arr[1, 1] := 1
--			arr[1, 2] := 2
--			arr[1, 3] := 3
--			arr[1, 4] := 4

--			arr[2, 1] := 5
--			arr[2, 2] := 6
--			arr[2, 3] := 7
--			arr[2, 4] := 8

--			arr[3, 1] := 9
--			arr[3, 2] := 10
--			arr[3, 3] := 11
--			arr[3, 4] := 12

--			arr[4, 1] := 13
--			arr[4, 2] := 14
--			arr[4, 3] := 15
--			arr[4, 4] := 16
			print( operator.det (arr))
		end

end
