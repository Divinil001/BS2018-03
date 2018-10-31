note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	rec (pre : STRING; s : STRING)
		local
			was : ARRAYED_LIST[BOOLEAN]
			nxt : STRING
			i : INTEGER
			j : INTEGER
		do
			nxt := ""
			create was.make_filled (500)
			if s.count = 1 then
				print(pre + s[1].out + "%N")
			else
				from i := 1 until i > s.count loop
					if was[s[i].code] = false then
						was[s[i].code] := true
						nxt := ""
						from j := 1 until j > s.count loop
							if j /= i then
								nxt := nxt + s[j].out
							end
							j := j + 1
						end
						rec(pre + s[i].out, nxt)
					end
					i := i + 1
				end
			end
		end

feature {NONE}
	make
		local
			s : STRING
			empty : STRING
		do
			print("Enter the string%N")
			io.read_line
			s := io.last_string.out
			empty := ""
			rec(empty, s)
		end

end
