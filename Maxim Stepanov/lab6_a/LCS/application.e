note
	description: "LCS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			s1, s2: STRING
		do
			s1 := "ABDEFGH"
			s2 := "AgBfCkDkE"

			print("Gonna calculate lcs of " + s1 + " and " + s2 + ":%N")
			print(lcs(s1, s2))
			print("%NAll.%N")
		end

	lcs(s1: STRING s2: STRING): STRING
	local
		first: STRING
		second: STRING
	do

		if s1.count <= 0 or s2.count <= 0 then
			Result := ""
		else
			if s1.substring (s1.count, s1.count) ~ s2.substring (s2.count, s2.count) then
				Result := lcs(s1.substring(1, s1.count - 1), s2.substring(1, s2.count - 1)) + s1.substring(s1.count, s1.count)
			else
				first := lcs(s1, s2.substring(1, s2.count - 1))
				second := lcs(s1.substring(1, s1.count - 1), s2)
				if first.count > second.count then
					Result := first
				else
					Result := second
				end
			end

		end
	end

end
