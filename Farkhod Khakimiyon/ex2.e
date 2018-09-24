class
	EX2

create
	make

feature
	x: STRING
	y: STRING
	make(x1, y1: STRING)
	do
		x := x1
		y := y1
	end
	lcs(i, j: INTEGER): STRING
	local
		f1: STRING
		f2: STRING
	do
		if i = 0 or j = 0 then
			result := ""
		elseif x[i] = y[j] then
			result := lcs(i - 1, j - 1) + x[i].out
		else
			f1 := lcs(i - 1, j)
			f2 := lcs(i, j - 1)
			if f1.count > f2.count then
				result := f1
			else
				result := f2
			end
		end
	end

end
