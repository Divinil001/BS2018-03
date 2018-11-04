note
	description: "anagrams application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			print("%NEnter a word: %N")
			io.read_line
			string := io.last_string
			anagram
		end

feature

	string: STRING

	anagram
		do
			anagram_help (1, string.count)
		end

	anagram_help (left, right: INTEGER)
		local
			i: INTEGER
			c: CHARACTER
		do
			if left = right then
				print (string + " ")
			else
				from i := left
				until i > right
				loop
					c := string [left]
					string [left] := string [i]
					string [i] := c -- swap string [left] with string [i]
					anagram_help (left + 1, right)
					c := string [left]
					string [left] := string [i]
					string [i] := c -- backtrack
					i := i + 1
				end
			end
		end

end
