class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			Io.put_string ("Enter the height of triangle >> ")
			Io.read_integer
			Io.put_string (make_triangle(Io.last_integer))
		end

	make_triangle(height_n: INTEGER): STRING
		local
			temp: ARRAYED_LIST[STRING]
			height, spaces, t, i, j: INTEGER
			line, line1, s, s1: STRING
		do
			create temp.make (0)
			height := height_n
			line := ""
			line1 := ""
			s := ""
			t := 1
			from
				i := 1
			until
				i > height
			loop
				line := ""
				line1 := ""
				if i \\ 2 = 0 then
					line.append (" ")
					line1.prepend (" ")
				end
				from
					j := 1
				until
					j > (i - 1) // 2 + 1
				loop
					line.append(t.out + " ")
					line1.prepend (" " + t.out)
					t := t + 1
					j := j + 1
				end
				line1.append ("%N")
				temp.extend (line)
				temp.extend (line1)
				i:=i+1
			end
			spaces := temp.last.count * 2
			from
				i := 1
			until
				i > temp.count
			loop
				s.append (temp[i])
				if i \\ 2 = 1 then
					s1 := " "
					s1.multiply(spaces - temp[i].count*2)
					s.append (s1)
				end
				i := i + 1
			end
			Result := s

		end
end
