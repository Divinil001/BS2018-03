class
	APPLICATION

create
	make

feature

	a, b : STRING
	make

		do
			Io.put_string ("Put string 1: ")
			Io.read_line
			a := Io.last_string.out

			Io.put_string ("Put string 2: ")
			Io.read_line
			b := Io.last_string.out

			print(lcs(a,b))
		end
	lcs(x, y :STRING):STRING

	do
		if x.count = 0 or y.count = 0 then
			Result := ""
		elseif x[x.count] = y[y.count] then
			Result := lcs(x.substring (1, x.count - 1), y.substring (1, y.count - 1)) + x[x.count].out
		else
			Result := longest(lcs(x, y.substring (1, y.count - 1)), lcs(x.substring (1,x.count - 1), y))
		end
	end

	longest(x,y :STRING):STRING
	do
		if x.count > y.count then
			Result := x
		else
			Result := y
		end
	end

end
