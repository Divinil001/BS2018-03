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

feature {NONE} -- Initialization

		s, s2:STRING
	make
			-- Run application.

		do
			--| Add your code here
			s := "hello"

			s2 := "eifell"

			print(LCS(s.count, s2.count))

		end

	LCS(i: INTEGER; j: INTEGER): INTEGER

	do

		if i = 0 or j = 0 then

			Result := 0

		else

			Result := LCS(i - 1, j)

			Result := Result.max(LCS(i, j - 1))

			if s.item (i).is_equal (s2.item (j)) then

				Result := Result.max (1 + LCS(i - 1, j - 1))

			end



		end

	end

end
