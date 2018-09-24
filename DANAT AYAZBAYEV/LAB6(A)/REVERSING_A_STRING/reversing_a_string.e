note
	description: "REVERSING_A_STRING application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	REVERSING_A_STRING

inherit
	ARGUMENTS

create
	make

feature
	recursive_reverse (a : STRING) : STRING
		do
			if a.count < 1 then
				Result := ""
			else
				Result := recursive_reverse(a.substring (2, a.count)) + a.at(1).out
			end

		end
	iterative_reverse (a : STRING) : STRING
		local
			s : STRING
			i : INTEGER
		do
			s := ""
			from
				i := a.count
			until
				i < 1
			loop
				s.append_character (a.at (i))
				i := i - 1
			end
			Result := s
		end

feature {NONE}
	make
		local
			s : STRING
		do
			io.read_line
			s := io.last_string
			print(iterative_reverse(s) + "%N" + recursive_reverse(s))
		end

end
