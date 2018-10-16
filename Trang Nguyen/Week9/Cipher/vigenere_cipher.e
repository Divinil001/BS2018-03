note
	description: "Summary description for {VIGENERE_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VIGENERE_CIPHER

inherit
	CIPHER

feature -- Access

	encrypt (text: STRING): STRING
		require else
			text_not_void: text /= Void
		local
			i, j: INTEGER
			char: INTEGER
			code: INTEGER
			key: STRING
		do
			print ("%NEnter pass phrase:%N")
			io.read_line
			key := io.last_string
			char := -1
			Result := ""
			text.to_upper
			key.to_upper
			from i := 0
			until i = text.count
			loop
				code := text.item (i + 1).code
				if code > 64 and code < 91 then
					char := char + 1
					j := char \\ key.count + 1
					code := code + key.item_code (j)
					code := code \\ 26 + 65
					Result.extend (code.to_character_8)
				else
					Result.extend (text.item (i + 1))
				end
				i := i + 1
			end
		end

	decrypt (text: STRING): STRING
		require else
			text_not_void: text /= Void
		local
			i, j: INTEGER
			char: INTEGER
			code: INTEGER
			key: STRING
		do
			print ("%NEnter pass phrase:%N")
			io.read_line
			key := io.last_string
			char := -1
			Result := ""
			text.to_upper
			key.to_upper
			from i := 0
			until i = text.count
			loop
				code := text.item_code (i + 1)
				if code > 64 and code < 91 then
					char := char + 1
					j := char \\ key.count + 1
					code := code - key.item_code (j)
					if code < 0 then
						code := 91 + code
					else code := 65 + code
					end
					Result.extend (code.to_character_8)
				else
					Result.extend (text.item (i + 1))
				end
				i := i + 1
			end
		end

end
