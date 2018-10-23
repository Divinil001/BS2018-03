class
	SPIRAL_CIPHER
inherit CIPHER

create make

feature
	make
		do
		end
feature
	sqrt(k : INTEGER) : INTEGER
		do
			Result := (k^0.5).truncated_to_integer
			if Result * Result /= k then
				Result := Result + 1
			end
		end
	encrypt(str : STRING): STRING
		local
			left, right, bottom, top, n, ind, i, j: INTEGER
			a: ARRAY2[CHARACTER]
		do
			n := sqrt(str.count)
			ind := 1
			create a.make_filled (' ', n, n)
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
					a[i, j] := str[ind]
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
					--print(j.out + " " + (n - right).out + "%N")
					Result := Result + a[j, n - right].out
					i := i + 1
					j := j + 1
				end

				right := right + 1

				from
					j := n - right
				until
					j < 1 + left or i > n*n
				loop
					--print((n - bottom).out + " " + (j).out + "%N")
					Result := Result + a[n - bottom, j].out
					i := i + 1
					j := j - 1
				end

				bottom := bottom + 1
				from
					j := n - bottom
				until
					j < 1 + top or i > n*n
				loop
					--print(j.out + " " + (1 + left).out + "%N")
					Result := Result + a[j, 1 + left].out
					i := i + 1
					j := j - 1
				end

				left := left + 1

				from
					j := 1 + left
				until
					j > n - right or i > n*n
				loop
					--print((1+top).out + " " + j.out + "%N")
					Result := Result + a[1 + top, j].out
					i := i + 1
					j := j + 1
				end
				top := top + 1
			end
		end

	decrypt (str: STRING) : STRING
		local
			left, right, bottom, top, n, ind, i, j: INTEGER
			a: ARRAY2[CHARACTER]
		do
			n := sqrt(str.count)
			ind := 1
			create a.make_filled (' ', n, n)

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
					--print(j.out + " " + (n - right).out + "%N")
					a[j, n - right] := str[i]
					i := i + 1
					j := j + 1
				end

				right := right + 1

				from
					j := n - right
				until
					j < 1 + left or i > str.count
				loop
					--print((n - bottom).out + " " + (j).out + "%N")
					a[n - bottom, j] := str[i]
					i := i + 1
					j := j - 1
				end

				bottom := bottom + 1
				from
					j := n - bottom
				until
					j < 1 + top or i > str.count
				loop
					--print(j.out + " " + (1 + left).out + "%N")
					a[j, 1 + left] := str[i]
					i := i + 1
					j := j - 1
				end

				left := left + 1

				from
					j := 1 + left
				until
					j > n - right or i > str.count
				loop
					--print((1+top).out + " " + j.out + "%N")
					a[1 + top, j] := str[i]
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
					Result := Result + a[i, j].out
					j := j + 1
				end
				i := i + 1
			end
		end
end
