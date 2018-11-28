class
	ANAGRAMS

inherit
	ARGUMENTS_32

create
	make

feature
	make
		local
			str: STRING;
			a: ARRAY [STRING]
			i: INTEGER
		do
			io.readline
			str := io.laststring.twin
			print("%N%N")
			solve(str.twin, 1, str.count)
		end

	solve(str:STRING; l,r:INTEGER)
		local
			i :INTEGER
			tmp : STRING
		do
			if (l = r) then
				print(str + "%N")
			else
				tmp:=str.twin
				from
					i:=l
				until
					i > r
				loop
					tmp := swap(tmp.twin, l, i)
					solve(tmp.twin, l+1, r)
					tmp := swap(tmp.twin, l ,i)
					i := i + 1
				end
			end
		end

	swap(str:STRING; a, b:INTEGER):STRING
		do
			Result := str.twin
			Result[a] := str[b]
			Result[b] := str[a]
		end
end

