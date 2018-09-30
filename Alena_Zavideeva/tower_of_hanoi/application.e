class
	APPLICATION

create
	make

feature
	k : INTEGER
	make
		do
			Io.put_string ("N: ")
			Io.read_integer
			k := Io.last_integer
			move(k, 1, 3)
		end
	move(n, start, finish: INTEGER)
	local
		tmp: INTEGER
		do
			if n = 1 then
				print(n.out + " " + start.out + " " + finish.out + "%N")
			else
				tmp := 6 - start - finish
				move(n - 1, start, tmp)
				print(n.out + " " + start.out + " " + finish.out + "%N")
				move(n - 1, tmp, finish)
			end
		end

end
