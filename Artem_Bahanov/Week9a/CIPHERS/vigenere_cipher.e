class
	VIGENERE_CIPHER
inherit
	KEYED_CIPHER
feature
	encrypt(text, key: STRING): STRING
	require else
		is_key_valid(key)
	local
		i, j, current_char, key_size: INTEGER
	do
		from
			key_size := key.count
			Result := ""
			i := 1
			j := 1
		until
			i > text.count
		loop
			current_char := text.code (i).to_integer_32
			if current_char >= start and current_char < start + size then
				Result.append_character(get_de_char(current_char, key.code ((j - 1) \\ key_size + 1).to_integer_32))
				j := j + 1
			else
				Result.append_character(text.at (i))
			end
			i := i + 1
		end
	end

	decrypt(text, key: STRING): STRING
	local
		i, j, current_char, key_size: INTEGER
	do
		from
			key_size := key.count
			Result := ""
			i := 1
			j := 1
		until
			i > text.count
		loop
			current_char := text.code (i).to_integer_32
			if current_char >= start and current_char < start + size then
				Result.append_character(get_de_char(current_char, - key.code ((j - 1) \\ key_size + 1).to_integer_32))
				j := j + 1
			else
				Result.append_character(text.at (i))
			end
			i := i + 1
		end
	end


feature{VIGENERE_CIPHER}
	get_de_char(current_char, key: INTEGER): CHARACTER -- get decypted / encrypted char
	do
		if key > 0 then
			Result := ((current_char - 2 * start + key) \\ 26 + start).to_character_8
		else
			Result := ((current_char + key + size) \\ 26 + start).to_character_8
		end

	end
end
