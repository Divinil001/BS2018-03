class
	CAESAR_CIPHER
inherit
	CIPHER
create make

feature
	shift : INTEGER
	make(shift_: INTEGER)
		do
			shift := shift_
		end
feature

	encrypt(str: STRING): STRING
	local
		i, tmp, k, A: INTEGER

	do
		Result := ""
		A := ('A').code;
		from
			i := 1
		until
			i > str.count
		loop
			if (str[i] < 'A') or (str[i] > 'Z') then
				Result := Result + str[i].out
			else
				k := (str[i].code + shift - A) \\ 26
				Result := Result + (A + k).to_character_8.out
			end

			i := i + 1
		end
	end


feature

	decrypt(str : STRING): STRING
	local
		i, tmp, k, A: INTEGER

	do
		Result := ""
		A := ('A').code;
		from
			i := 1
		until
			i > str.count
		loop
			if (str[i] < 'A') or (str[i] > 'Z') then
				Result := Result + str[i].out
			else
				k := (str[i].code - shift - A) \\ 26
				if k < 0 then
					k := k + 26
				end
				Result := Result + (A + k).to_character_8.out
			end

			i := i + 1
		end
	end

end
