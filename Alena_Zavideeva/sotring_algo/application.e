class
	APPLICATION
create
	make

feature
	arr_: ARRAY[INTEGER]
	n, ind : INTEGER
	make
		do
			Io.put_string ("N: ")
			Io.read_integer
			n := Io.last_integer
			create arr_.make_filled(0, 1, n)
			from
				ind := 1
			until
				ind > n
			loop
				Io.read_integer
				arr_[ind] := Io.last_integer
				ind := ind + 1
			end
			arr_ := algo_sort(arr_)

			from
				ind := 1
			until
				ind > n
			loop
				Io.put_string (arr_[ind].out+ " ")
				ind := ind + 1
			end
		end

	algo_sort(a: ARRAY[INTEGER]): ARRAY[INTEGER]
	local
		a1, a2: ARRAY[INTEGER]
	do
		if a.count = 1 then
			Result := a
		else
			a1 := algo_sort(subarray(a, 1, a.count//2))
			a2 := algo_sort(subarray(a, a.count//2 + 1, a.count))
			Result := merge(a1, a2)
		end
	end

	merge (a1, a2 : ARRAY[INTEGER]):ARRAY[INTEGER]
	local
		fl1, fl2, i: INTEGER

	do
		create Result.make_filled(0, 1, a1.count + a2.count)
		from
			i := 1
			fl1 := 1
			fl2 := 1
		until
			i > Result.count
		loop
			if
				fl1 > a1.count
			then
				Result[i] := a2[fl2]
				fl2 := fl2 + 1
			elseif fl2 > a2.count then
				Result[i] := a1[fl1]
				fl1 := fl1 + 1
			else
				if
					a1[fl1] > a2[fl2]
				then
					Result[i] := a2[fl2]
					fl2 := fl2 + 1
				else
					Result[i] := a1[fl1]
					fl1 := fl1 + 1
				end
			end
			i := i + 1
		end
	end

	subarray(a:ARRAY[INTEGER]; i, j : INTEGER): ARRAY[INTEGER]
	require
		suitable_index: i <= j
	local
		arr : ARRAY[INTEGER]
		m, k : INTEGER
	do
		create arr.make_filled (0, 1, j - i + 1)
		k := i
		from
			m := 1
		until
			k > j
		loop
			arr[m] := a[k]
			m := m + 1
			k := k + 1
		end
		Result := arr
	end
end
