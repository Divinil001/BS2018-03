note
	description: "LONGEST_COMMON_SUBSEQUENCE application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	LONGEST_COMMON_SUBSEQUENCE

inherit
	ARGUMENTS

create
	make

feature
	global : INTEGER
	s : STRING
	s2 : STRING

feature
	lcs (l : INTEGER; r : INTEGER) : STRING
		local
			s3 : STRING
			s4 : STRING
		do
			if l = 1 and r = 1 then
				if s.at(l) = s2.at (r) then
					Result := s.substring (1, 1)
				else
					Result := ""
				end
			elseif l = 1 then
				if s.at (l) = s2.at (r) then
					Result := s.substring (1, 1)
				else
					Result := lcs(l, r - 1)
				end
			elseif r = 1 then
				if s.at (l) = s2.at (r) then
					Result := s2.substring (1, 1)
				else
					Result := lcs(l - 1, r)
				end
			else
				if s.at (l) = s2.at (r) then
					s3 := lcs(l - 1, r - 1)
					s3.append_character (s.at (l))
					Result := s3
				else
					s3 := lcs(l - 1, r)
					s4 := lcs(l, r - 1)

					if s3.count > s4.count then
						Result := s3
					else
						Result := s4
					end
				end
			end
			--print(x + " " + y + " " + Result + "%N")
		end

feature {NONE}
	make
		local
			i : INTEGER
		do
			s := "danat"
			s2 := "ayazbayev"
			print(lcs(s.count, s2.count))
		end

end
