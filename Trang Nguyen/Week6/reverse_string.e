note
	description: "Summary description for {REVERSE_STRING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REVERSE_STRING

feature -- Access

	recursive_help (s: STRING; i: INTEGER): STRING
			-- `recursive_help'
		local
			c: CHARACTER
		do
			if i < s.count/2 then
				c := s[i]
				s[i] := s[s.count + 1 - i]
				s[s.count + 1 - i] := c
				Result := recursive_help (s, i + 1)
			else
				Result := s
			end
		end

	recursive (s: STRING): STRING
			-- `recursive'
		do
			if not s.is_empty then
				Result := recursive_help (s, 1)
			else Result := ""
			end
		end

	iterative (s: STRING): STRING
			-- `iterative'
		local
			i: INTEGER
		do
			Result := ""
			 from i:= s.count
			 until i = 0
			 loop
			 	Result := Result + s[i].out
			 	i := i - 1
			 end
		end

end
