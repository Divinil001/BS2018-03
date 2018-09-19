note
	description: "STRING_ROTATION application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	STRING_ROTATION

inherit
	ARGUMENTS

create
	make

feature
	is_substring (s1, s2 : STRING) : BOOLEAN
		local
			i : INTEGER
			j : INTEGER
		do
			Result := FALSE
			from
				i := 1
			until
				i + s1.count - 1 > s2.count or Result = TRUE
			loop
				from
					j := 1
				until
					j > s1.count or s1[j] /= s2[i + j - 1]
				loop
					j := j + 1
				end
				if j > s1.count then
					Result := TRUE
				end
				i := i + 1
			end
		end
	is_rotation (s1, s2 : STRING) : BOOLEAN
		do
			Result := False
			if s1.count = s2.count then
				s2.multiply (2)
				if is_substring(s1, s2) then
					Result := TRUE
				end
			end
		end
feature
	s : STRING
	s3 : STRING

feature {NONE}
	make
		do
			s := "helloworld"
			s3 := "loworldhel"
			print((is_rotation(s, s3)).out + "%N")
			s := "CODE"
			s3 := "EDOC"
			print((is_rotation(s, s3)).out + "%N")
		end
end
