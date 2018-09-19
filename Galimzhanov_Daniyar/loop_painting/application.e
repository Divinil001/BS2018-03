class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature {NONE}

	draw (k: INTEGER)
		require
			k>0
		local
			i, j, l, m: INTEGER
			s, d, s_2: STRING
		do
			l := 1
			--m := (k //2 + 4) * 3
			if k < 26 then
				m := (k + 1) * 2
			else
				m := (k + 2) * 2
			end


			d := " "
			from
				i := 1
			until
				i = k + 1
			loop
				if i \\ 2 = 1 then
					s := ""
					s_2 := " "
					from
						j := 1
					until
						j = (i // 2 + 2)
					loop
						s := s + l.out + " "
						j := j + 1
						l := l + 1
					end
					l := l - 1
					from
						j := (i // 2 + 1)
					until
						j = 0
					loop
						s_2 := s_2 + " " + l.out
						j := j - 1
						l := l - 1
					end
					d := " "
					d.multiply (m - s.count)
					s := s + d
					s_2 := d + s_2
					print (s + s_2)
					print ("%N")
					l := l + i // 2 + 2
					i := i + 1
				else
					s := ""
					s_2 := ""
					print (" ")
					from
						j := 1
					until
						j = (i // 2 + 1)
					loop
						s := s + l.out + " "
						j := j + 1
						l := l + 1
					end
					l := l - 1
					from
						j := (i // 2)
					until
						j = 0
					loop
						s_2 := s_2 + l.out + " "
						j := j - 1
						l := l - 1
					end
					d := " "
					d.multiply (m - s.count)
					s := s + d
					s_2 := d + s_2
					print (s + s_2)
					print ("%N")
					l := l + 2
					i := i + 1
				end
				--i := i + 1
			end
		end

	make
		do
		    io.putstring("Write height: ")
			io.read_integer
			draw (io.last_integer)
		end

end
