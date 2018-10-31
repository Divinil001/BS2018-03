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
		--pre is the string composed from the characters program chose in every depth level of recursion
		--and in the original string size-th depth 'pre' is printed and the remaining character is printed
		--and the another one anagram is ready and printed
		local
			was : ARRAYED_LIST[BOOLEAN] 
			--was[i] = true if ascii of the symbol appeared before
			--without this check when two symbols are the same output will contain two same strings
			--for example abb -> abb abb bab bba bab bba
			--but the right answer is abb bab bba
			nxt : STRING 
			--it is the string except i-th element because 
			--my algorithm works recursively by calling 
			--function from other string except i-th element
			--and adding i-th element to the end of 'pre' string
			i : INTEGER
			j : INTEGER
		do
			nxt := ""
			create was.make_filled (500)
			--i think ascii code will not exceed 500
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
