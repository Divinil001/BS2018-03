class
	VIGENERE_CIPHER

inherit
	KEYED_CIPHER

feature

	encrypt (t: STRING; k: STRING): STRING
	local
		i, j, curr: INTEGER
	do
		Result := ""

		from
			i := 1
			j := 1
		until
			i > t.count
		loop
			curr := t.code (i).to_integer_32

			if curr >= 65 and curr < 91 then

				Result.append_character(get_new_char(curr, k.code ((j - 1) \\ k.count + 1).to_integer_32))
				j := j + 1
			else
				Result.append_character(t.at (i))
			end

			i := i + 1
		end
	end

	decrypt (t: STRING; k: STRING): STRING
	local
		i, j, curr: INTEGER
	do
		Result := ""

		from
			i := 1
			j := 1
		until
			i > t.count
		loop
			curr := t.code (i).to_integer_32

			if curr >= 65 and curr < 91 then
				Result.append_character(get_new_char(curr, - k.code ((j - 1) \\ k.count + 1).to_integer_32))
				j := j + 1
			else
				Result.append_character(t.at (i))
			end

			i := i + 1
		end
	end

feature{VIGENERE_CIPHER}

	get_new_char (c, k: INTEGER): CHARACTER
	do
		if k > 0 then
			Result := ((c - 130 + k) \\ 26 + 65).to_character_8
		else
			Result := ((c + k + 26) \\ 26 + 65).to_character_8
		end

	end
end
