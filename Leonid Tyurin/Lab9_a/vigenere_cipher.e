note
	description: "Summary description for {VIGENERE_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VIGENERE_CIPHER
inherit
	CIPHER

feature

	encrypt(text, key : STRING) : STRING
		local
			res : STRING
			i, code, k : INTEGER
		do
			create res.make_filled (' ', text.capacity)
			k := 0
			text.to_lower
			key.to_lower
			from i := 1 until i > text.capacity loop
				if text[i].code >= ('a').code and text[i].code <= ('z').code then
					code := (text[i].code + key[1 + ((i-1-k) \\ key.capacity)].code - 2 * ('a').code)\\26 + ('a').code
					res[i] := code.to_character_8
				else
					res[i] := text[i]
					k := k + 1
				end
				i := i + 1
			end
			result := res
		end

	decrypt(text, key : STRING) : STRING
		local
			res : STRING
			i, code, k : INTEGER
		do
			text.to_lower
			key.to_lower
			create res.make_filled (' ', text.capacity)
			k := 0
			from i := 1 until i > text.capacity loop
				if text[i].code >= ('a').code and text[i].code <= ('z').code then
					code := (text[i].code - key[1 + ((i-1-k) \\ key.capacity)].code + 26) \\ 26 + ('a').code
					res[i] := code.to_character_8
				else
					res[i] := text[i]
					k := k + 1
				end
				i := i + 1
			end
			result := res
		end
end
