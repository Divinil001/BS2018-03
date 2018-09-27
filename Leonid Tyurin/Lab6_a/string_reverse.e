note
	description: "Summary description for {STRING_REVERSE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STRING_REVERSE

feature

	reverse_rec(s : STRING):STRING
		do
			if s.capacity = 1 then
				result := s
			else
				result := reverse_rec(s.substring (2, s.capacity))
				result.append_character (s[1])
			end
		end

	reverse_it(s : STRING):STRING
		local
			i : INTEGER
		do
			create result.make_empty
			from
				i := s.capacity
			until
				i = 0
			loop
				result.append_character(s[i])
				i := i - 1
			end
		end

end
