note
	description: "Summary description for {SPIRAL_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPIRAL_CIPHER

	inherit
		CIPHER
		SINGLE_MATH

feature

	encrypt(str : STRING): STRING

		local

			left, right, bottom, top, n, ind, i, j: INTEGER
			array: ARRAY2[CHARACTER]

		do

			n := sqrt(str.count).ceiling
			ind := 1

			create array.make_filled (' ', n, n)

			from
				i := 1
			until
				i > n or ind > str.count
			loop

				from
					j := 1
				until
					j > n or ind > str.count
				loop
					array[i, j] := str[ind]
					j := j + 1
					ind := ind + 1
				end
				i := i + 1
			end

			Result := ""
			left := 0
			right := 0
			bottom := 0
			top := 0

			from
				i := 1
			until
				i > n*n
			loop

				from
					j := 1 + top
				until
					j > n - bottom or i > n*n
				loop
					Result := Result + array[j, n - right].out
					i := i + 1
					j := j + 1
				end

				right := right + 1
				from
					j := n - right
				until
					j < 1 + left or i > n*n
				loop
					Result := Result + array[n - bottom, j].out
					i := i + 1
					j := j - 1

				end

				bottom := bottom + 1
				from
					j := n - bottom
				until
					j < 1 + top or i > n*n
				loop
					Result := Result + array[j, 1 + left].out
					i := i + 1
					j := j - 1
				end

				left := left + 1
				from
					j := 1 + left
				until
					j > n - right or i > n*n
				loop
					Result := Result + array[1 + top, j].out
					i := i + 1
					j := j + 1
				end
				top := top + 1
			end
		end

	decrypt (str: STRING) : STRING
		local
			left, right, bottom, top, n, ind, i, j: INTEGER
			array: ARRAY2[CHARACTER]
		do
			n := sqrt(str.count).ceiling
			ind := 1
			create array.make_filled (' ', n, n)
			left := 0
			right := 0
			bottom := 0
			top := 0

			from
				i := 1
			until
				i > n*n
			loop

				from
					j := 1 + top
				until
					j > n - bottom or i > str.count
				loop

					array[j, n - right] := str[i]
					i := i + 1
					j := j + 1

				end

				right := right + 1
				from
					j := n - right
				until
					j < 1 + left or i > str.count

				loop
					array[n - bottom, j] := str[i]
					i := i + 1
					j := j - 1

				end
				bottom := bottom + 1
				from
					j := n - bottom
				until
					j < 1 + top or i > str.count
				loop
					array[j, 1 + left] := str[i]
					i := i + 1
					j := j - 1
				end
				left := left + 1

				from
					j := 1 + left
				until
					j > n - right or i > str.count
				loop
					array[1 + top, j] := str[i]
					i := i + 1
					j := j + 1

				end

				top := top + 1

			end
			from
				i := 1
				Result := ""
			until
				i > n
			loop
				from
					j := 1
				until
					j > n
				loop
					Result := Result + array[i, j].out
					j := j + 1
				end
				i := i + 1
			end
		end

end
