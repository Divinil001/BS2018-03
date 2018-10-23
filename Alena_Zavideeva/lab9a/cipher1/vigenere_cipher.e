class
	VIGENERE_CIPHER
inherit
	CIPHER
create make

feature
	key : STRING
	make(key_: STRING)
		do
			key := key_
		end
feature
	encrypt (str: STRING): STRING
		local
			i, tmp, k, A, shift, ind: INTEGER

		do
			Result := ""
			A := ('A').code;
			from
				i := 1
				ind := 1
			until
				i > str.count
			loop
				if (str[i] < 'A') or (str[i] > 'Z') then
					Result := Result + str[i].out
				else
					shift := key[ind].code - A
					k := (str[i].code + shift - A) \\ 26
					Result := Result + (A + k).to_character_8.out
					ind := ind + 1
					if ind > key.count then
						ind := 1
					end
				end
				i := i + 1
			end
		end


feature

	decrypt(str : STRING): STRING
	local
		i, tmp, k, A, shift, ind: INTEGER

	do
		Result := ""
		A := ('A').code;
		from
			i := 1
			ind := 1
		until
			i > str.count
		loop
			if (str[i] < 'A') or (str[i] > 'Z') then
				Result := Result + str[i].out
			else
				shift := key[ind].code - A
				k := (str[i].code - shift - A) \\ 26
				if k < 0 then
					k := k + 26
				end
				ind := ind + 1
				if ind > key.count then
					ind := 1
				end
				Result := Result + (A + k).to_character_8.out
			end

			i := i + 1
		end
	end

end
