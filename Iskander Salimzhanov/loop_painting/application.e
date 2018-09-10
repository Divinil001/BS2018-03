note
	description: "loop_painting application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			lvl: INTEGER
			ans: ARRAYED_LIST [CHARACTER]
			i: INTEGER
			j: INTEGER
			x: INTEGER
			last: INTEGER
			c: CHARACTER
			-- Run application.
		do
			io.read_integer
			lvl := io.last_integer
			from
				i := 1
			until
				i = lvl + 1
			loop
				create ans.make(i * 4 - 1)
				from
					j := 1
				until
					j = i * 2 + 1
				loop
					if j \\ 2 = 0 then
						ans.extend ('_')
					else
						x := j // 2 + 1
						if x < 10 then
							ans.extend (x.to_hex_character)
						else
							ans.extend ('a' + x - 10)
						end
					end
					j := j + 1
				end

				from
					j := i * 2 + 1
				until
					j = lvl * 4
				loop
					ans.extend ('_')
					j := j + 1
				end

				from
					j := lvl * 4 - 1
					last := 1
				until
					j = lvl * 4 - i * 2
				loop
					if j \\ 2 = 1 then
						if last < 10 then
							ans.i_th(j) := last.to_hex_character
						else
							ans.i_th(j) := 'a' + last - 10
						end
						last := last + 1
					end
					j := j - 1
				end
				from
					j := 1
				until
					j = lvl * 4
				loop
					print(ans.i_th (j))
					j := j + 1
				end
				print("%N")
				i := i + 1
			end
		end

end
