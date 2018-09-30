class
	APPLICATION

create
	make

feature
	n : INTEGER
	set : TWO_WAY_SORTED_SET[INTEGER]
	test : ARRAY[TWO_WAY_SORTED_SET[INTEGER]]
	make
	local
		i: INTEGER
		str : STRING
		do
			create set.make
			set.put(1)
			set.put(2)
			set.put(3)
			test := power_set(set)
			from
				i:= 1
			until
				i > test.count
			loop
				str := "{"
				across test[i] as it
				loop
					str := str + (it.item).out + " "
				end
				print(str + "}%N")
				 i:= i + 1
			variant
				test.count + 1 - i
			end

		end

	power_set(a:TWO_WAY_SORTED_SET[INTEGER]): ARRAY[TWO_WAY_SORTED_SET[INTEGER]]
	local
		i,j, k : INTEGER
		tmp : TWO_WAY_SORTED_SET[INTEGER]
		arr: ARRAY[INTEGER]
		do
			create tmp.make
			create Result.make_filled (tmp, 1, (2^a.count).truncated_to_integer)
			create arr.make_filled(0, 1, a.count)
			i := 1
			across a as it
			loop
				arr[i] := it.item
				i := i + 1
			end
			from
				i := 1
			until
				i > 2^a.count
			loop

				create tmp.make
				from
					j := 1
					k := i
				until
					k = 0 or j > arr.count
				loop
					if k \\ 2 = 1 then
						tmp.put (arr[j])
					end
					j := j + 1
					k := k // 2
				end
				Result[i] := tmp
				i := i + 1
			end
		end

end
