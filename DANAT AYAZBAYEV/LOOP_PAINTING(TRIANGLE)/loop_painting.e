note
	description: "LOOP_PAINTING application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	LOOP_PAINTING

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			num : INTEGER
			save_num : INTEGER
			n : INTEGER
			i : INTEGER
			space : INTEGER
			cur : INTEGER
			last : INTEGER
			cur_space : INTEGER
			height : INTEGER
		do
			space := 0
			last := 0
			io.read_integer
			num := io.last_integer
			save_num := num
			num := (num + 1) // 2
			n := num * (num + 1)
			if save_num \\ 2 = 1 then
				n := n - num
			end

			from
				i := n
			until
				i = n - num
			loop
				from
					cur := i
				until
					cur = 0
				loop
					space := space + 1
					cur := cur // 10
				end
				space := space + 1
				i := i - 1
			end
			if save_num \\ 2 = 0 then
				space := space + 1
			end
			space := space * 2
			from
				height := 2
				i := 1
			until
				i > n
			loop
				from
					cur := i
				until
					cur = 0
				loop
					cur_space := cur_space + 1
					cur := cur // 10
				end
				if i - last = height // 2 then
					height := height + 1
					print(i)
					from
						cur := 1
					until
						cur > space - cur_space - cur_space
					loop
						print(" ")
						cur := cur + 1
					end
					cur_space := 0
					from
						cur := i
					until
						cur = last
					loop
						if cur /= last + 1 then
							print(cur.out + " ")
						else
							if height \\ 2 = 0 then
								print(cur.out + " ")
							else
								print(cur.out)
							end
						end
						cur := cur - 1
					end
					print("%N")
					if height \\ 2 = 1 then
						print(" ")
						cur_space := cur_space + 1
					end
					last := i
				else
					cur_space := cur_space + 1
					print(i.out + " ")
				end
				i := i + 1
			end
		end
end
