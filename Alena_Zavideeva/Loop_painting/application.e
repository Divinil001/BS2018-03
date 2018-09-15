class
	APPLICATION
create
	make
feature
	n : INTEGER
	a :  LINKED_LIST[LINKED_LIST[INTEGER]]
feature
	make
		local
			pr: LINKED_LIST[INTEGER]
			times, tmp, count, i, j, number: INTEGER
			s, t : STRING
		do
			Io.put_string("N: ")
			Io.read_integer
			n := Io.last_integer
			create a.make
			times := 0
			tmp := 1
			count := 1
			from
				i := 1
			until
				i > n
			loop
				i := i + 1
				if  (times < 2) then
					create pr.make
					from
						j := 1
					until
						j > tmp
					loop
						pr.extend(count)
						count := count + 1
						j := j + 1
					end

					a.extend(pr)
					times := times + 1
				else
					tmp := tmp + 1
					times := 1
					create pr.make
					from
						j := 1
					until
						j > tmp
					loop
						pr.extend (count)
						count := count + 1
						j := j + 1
					end
					a.extend(pr)
				end
			end
		s := ""
		times := 0
		if
				n\\2 =  0
			then
				s := s + " "
		end

		from
			j := 1
		until
			j > a[a.count].count
		loop
			pr := a[a.count]
			s := s + pr[j].out + " "
			j := j + 1
		end
		times := s.count*2
		number := times - 2

		from
			i := 1
		until
			i > n
		loop
			s := ""
			if
				i \\ 2 /= 0
			then

				from
					j := 1
				until
					j > a[i].count
				loop
					pr := a[i]
					s := s + pr[j].out + " "
					j := j + 1
				end

				if times - 2*s.count = 0 then
					t := ""
				else
					t := " "
					t.multiply (times - 2*s.count)
				end

				s := s + t
				from
					j := a[i].count
				until
					j < 1
				loop
					pr := a[i]
					s := s + (pr[j].out) + " "
					j := j - 1
				end
				s := s + "%N"
				Io.put_string (s)
				number := s.count
			else
				s := s + " "
				from
					j := 1
				until
					j > a[i].count
				loop
					pr := a[i]
					s := s + pr[j].out + " "
					j := j + 1
				end
				if times - 2*s.count = 0 then
					t := ""
				else
					t := " "
					t.multiply (times - 2*s.count)
				end
				s := s + t
				from
					j := a[i].count
				until
					j < 1
				loop
					pr := a[i]
					s := s + pr[j].out + " "
					j := j - 1
				end
				s := s + "%N"
				Io.put_string (s)
				number := number - s.count
			end
			i := i + 1
		end

	end

end
