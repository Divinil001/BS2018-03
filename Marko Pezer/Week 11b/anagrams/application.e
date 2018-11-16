note
	description: "anagrams application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	word, cword: STRING
	list: ARRAYED_LIST[BOOLEAN]
	c, last: CHARACTER

	make
	local
		i, j: INTEGER
	do
		-- Input data

		io.put_string ("Enter your string: ")
		io.read_line
		word := io.last_string

		-- Initialization

		create list.make (0)
		c := ' '

		from i := 1
		until i > word.count
		loop
			i := i + 1
			list.extend (False)
		end

		-- String sorting

		from i := 1
		until i > word.count
		loop
			from j := i + 1
			until j > word.count
			loop
				if (word[j] < word[i]) then
					c := word[i]
					word[i] := word[j]
					word[j] := c
				end
				j := j + 1
			end
			i := i + 1
		end

		-- Print anagrams

		io.put_string ("%NList of anagrams: %N%N")
		find_anagrams (word.count, list, "")
		io.put_new_line
	end

	find_anagrams (length: INTEGER; flag: ARRAYED_LIST[BOOLEAN]; iword: STRING)
	local
		i, j: INTEGER
	do
		last := ' '
		cword := iword.twin

		if length = 0 then
			io.put_string (" " + iword + "%N")
		else
			from i := 1
			until i > word.count
			loop
				if (flag[i] = False and last /= word[i]) then
					last := word[i]
					flag[i] := True
					cword := cword + word[i].out
					find_anagrams (length - 1, flag, cword.twin)
					flag[i] := False
					cword.remove_tail (1)
				end
				i := i + 1
			end
		end
	end

end
