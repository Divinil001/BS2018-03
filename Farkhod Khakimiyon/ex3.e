class
	EX3

create
	make

feature
	x: ARRAY[INTEGER]
	make(y: ARRAY[INTEGER])
	do
		x := y
	end
	sort(l, r: INTEGER): ARRAY[INTEGER]
	local
		left: ARRAY[INTEGER]
		right: ARRAY[INTEGER]
		m: INTEGER
		i: INTEGER
		j: INTEGER
	do
		create result.make_filled (0, 1, r - l + 1)
		if l = r then
			result[1] := x[l]
		else
			m := (l + r) // 2
			left := sort(l, m)
			right := sort(m + 1, r)
			from
				i := 1
				j := 1
			until
				i > m - l + 1 and j > r - m
			loop
				if j > r - m then
					result[i + j - 1] := left[i]
					i := i + 1
				elseif i <= m - l + 1 and left[i] <= right[j] then
					result[i + j - 1] := left[i]
					i := i + 1
				else
					result[i + j - 1] := right[j]
					j := j + 1
				end
			end
		end
	end

end
