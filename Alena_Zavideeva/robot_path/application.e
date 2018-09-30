class
	APPLICATION
create
	make

feature
	graph : ARRAY2[INTEGER]
	used : ARRAY2[INTEGER]
	path : STRING
	n, m, i, j: INTEGER
	make
	local
		tmp: STRING
		do
			Io.put_string ("N: ")
			Io.read_integer
			n := Io.last_integer

			Io.put_string ("M: ")
			Io.read_integer
			m := Io.last_integer

			create graph.make_filled(0, n, m)
			create used.make_filled(0, n, m)
			path := "NONE"

			from
				i := 1
			until
				i > n
			loop
				Io.read_line
				tmp := Io.last_string.out
				from
					j := 1
				until
					j > m
				loop
					graph[i, j] := tmp[j].out.to_integer
					j := j + 1
				end
				i := i + 1
			end

			print("%N")
			dfs(1,1,"")
			print(path)

		end

	dfs(x, y : INTEGER; str: STRING)
	do
		used[x, y] := 1
		if x = n and y = m then
			path := str
		else
			if x + 1 <= n then
				if graph[x+1, y] /= 1 and used[x+1,y] /= 1 then
					dfs(x+1, y, str + "D")
				end
			end
			if y + 1 <= m then
				if graph[x, y + 1] /= 1 and used[x ,y + 1] /= 1 then
					dfs(x, y + 1, str + "R")
				end
			end
		end
	end

end
