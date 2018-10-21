	note
	description: "string_reverse application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	rec_reverse(s: STRING): STRING
	local
		res: STRING
		i: INTEGER
	do
		res := ""
		if s.count = 1 then
			Result := s
		else
			res.append_character (s[s.count])
			res.append (rec_reverse(s.substring (1, s.count - 1)))
			Result := res
		end
		print("%N")
		print("Incoming string: " + s.out + " Result: " + Result)
		print("%N")
	end

	iter_reverse(s: STRING): STRING
	local
		res: STRING
		i: INTEGER
	do
		res := ""
		from
			i := s.count
		until
			i = 0
		loop
			res.append_character (s[i])
			i := i - 1
		end
		Result := res
	end

feature {NONE}
	make
	local
		s: STRING
			-- Run application.
		do
			s := "1234567890"
			print(iter_reverse(s))
			print("%N")
			print(rec_reverse(s))
		end

end
