note
	description: "TOWER_OF_HANOI application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	TOWER_OF_HANOI

inherit
	ARGUMENTS

create
	make

feature
	a : ARRAYED_LIST[INTEGER]
	b : ARRAYED_LIST[INTEGER]
	c : ARRAYED_LIST[INTEGER]

feature {NONE}
	make
		local
			n : INTEGER
			step : INTEGER
			i : INTEGER
		do
			create a.make (0)
			create b.make (0)
			create c.make (0)
			io.read_integer
			n := io.last_integer
			from
				step := n
			until
				step = 0
			loop
				a.extend (step)
				a.forth
				step := step - 1
			end
			from
				i := 1
			until
				i > n
			loop
				if i <= a.count then
					print(a[i].out + " ")
				else
					print("0 ")
				end
				i := i + 1
			end
			print("%N")
			from
				i := 1
			until
				i > n
			loop
				if i <= b.count then
					print(b[i].out + " ")
				else
					print("0 ")
				end
				i := i + 1
			end
			print("%N")
			from
				i := 1
			until
				i > n
			loop
				if i <= c.count then
					print(c[i].out + " ")
				else
					print("0 ")
				end
				i := i + 1
			end
			print("%N")
			print("%N")
			from
				step := 1
			until
				c.count = n or b.count = n
			loop
				if step \\ 3 = 1 then
					if n \\ 2 = 1 then
						if a.count > 0 and c.count > 0 then
							if a[a.count] > c[c.count] then
								a.extend(c[c.count])
								a.forth
								c.remove
								c.back
								--print("3 -> 1  ")
							else
								c.extend(a[a.count])
								c.forth
								a.remove
								a.back
								--print("1 -> 3  ")
							end
						elseif a.count > 0 then
							c.extend(a[a.count])
							c.forth
							a.remove
							a.back
							--print("1 -> 3  ")
						elseif c.count > 0 then
							a.extend(c[c.count])
							a.forth
							c.remove
							c.back
							--print("3 -> 1  ")
						end
					else
						if a.count > 0 and b.count > 0 then
							if a[a.count] > b[b.count] then
								a.extend(b[b.count])
								a.forth
								b.remove
								b.back
								--print("2 -> 1  ")
							else
								b.extend(a[a.count])
								b.forth
								a.remove
								a.back
								--print("1 -> 2  ")
							end
						elseif a.count > 0 then
							b.extend(a[a.count])
							b.forth
							a.remove
							a.back
							--print("1 -> 2  ")
						elseif b.count > 0 then
							a.extend(b[b.count])
							a.forth
							b.remove
							b.back
							--print("2 -> 1  ")
						end
					end
				elseif step \\ 3 = 2 then
					if n \\ 2 = 1 then
						if a.count > 0 and b.count > 0 then
							if a[a.count] > b[b.count] then
								a.extend(b[b.count])
								a.forth
								b.remove
								b.back
								--print("2 -> 1  ")
							else
								b.extend(a[a.count])
								b.forth
								a.remove
								a.back
								--print("1 -> 2  ")
							end
						elseif a.count > 0 then
							b.extend(a[a.count])
							b.forth
							a.remove
							a.back
							--print("1 -> 2  ")
						elseif b.count > 0 then
							a.extend(b[b.count])
							a.forth
							b.remove
							b.back
							--print("2 -> 1  ")
						end
					else
						if a.count > 0 and c.count > 0 then
							if a[a.count] > c[c.count] then
								a.extend(c[c.count])
								a.forth
								c.remove
								c.back
								--print("3 -> 1  ")
							else
								c.extend(a[a.count])
								c.forth
								a.remove
								a.back
								--print("1 -> 3  ")
							end
						elseif a.count > 0 then
							c.extend(a[a.count])
							c.forth
							a.remove
							a.back
							--print("1 -> 3  ")
						elseif c.count > 0 then
							a.extend(c[c.count])
							a.forth
							c.remove
							c.back
							--print("3 -> 1  ")
						end
					end
				else
					if n \\ 2 = 1 then
						if a.count > 0 and c.count > 0 then
							if b[b.count] > c[c.count] then
								b.extend(c[c.count])
								b.forth
								c.remove
								c.back
								--print("3 -> 2  ")
							else
								c.extend(b[b.count])
								c.forth
								b.remove
								b.back
								--print("2 -> 3  ")
							end
						elseif b.count > 0 then
							c.extend(b[b.count])
							c.forth
							b.remove
							b.back
							--print("2 -> 3  ")
						elseif c.count > 0 then
							b.extend(c[c.count])
							b.forth
							c.remove
							c.back
							--print("3 -> 2  ")
						end
					else
						if a.count > 0 and c.count > 0 then
							if b[b.count] > c[c.count] then
								b.extend(c[c.count])
								b.forth
								c.remove
								c.back
								--print("3 -> 2  ")
							else
								c.extend(b[b.count])
								c.forth
								b.remove
								b.back
								--print("2 -> 3  ")
							end
						elseif b.count > 0 then
							c.extend(b[b.count])
							c.forth
							b.remove
							b.back
							--print("2 -> 3  ")
						elseif c.count > 0 then
							b.extend(c[c.count])
							b.forth
							c.remove
							c.back
							--print("3 -> 2  ")
						end
					end
				end
				from
					i := 1
				until
					i > n
				loop
					if i <= a.count then
						print(a[i].out + " ")
					else
						print("0 ")
					end
					i := i + 1
				end
				print("%N")
				from
					i := 1
				until
					i > n
				loop
					if i <= b.count then
						print(b[i].out + " ")
					else
						print("0 ")
					end
					i := i + 1
				end
				print("%N")
				from
					i := 1
				until
					i > n
				loop
					if i <= c.count then
						print(c[i].out + " ")
					else
						print("0 ")
					end
					i := i + 1
				end
				print("%N")
				print("%N")
				step := step + 1
			end
		end

end
