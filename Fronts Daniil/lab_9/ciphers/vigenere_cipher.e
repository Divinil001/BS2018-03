note
	description: "Summary description for {VIGENERE_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VIGENERE_CIPHER
--inherit
--	CIPHER
--	redefine
--		decrypt,
--		encrypt
--	end
feature

	plus(ch: CHARACTER; key_ch: CHARACTER): CHARACTER
	local
		alp: STRING
		num: INTEGER
	do
	--	print(ch.out + " " + key_ch.out + "%N")
		alp := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		num := alp.index_of (key_ch, 1)
		if ch.is_alpha then
			if alp.index_of (ch, 1) + num <= alp.count + 1 then
				Result := alp.item (alp.index_of (ch, 1) + num - 1)
			else
				Result := alp.item (alp.index_of (ch, 1) + num - alp.count - 1)
			end
		else
			Result := ch
		end
	end

	sub(ch: CHARACTER; key_ch: CHARACTER): CHARACTER
	local
		alp: STRING
		num: INTEGER
	do
		alp := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		num := alp.index_of (key_ch, 1)
		if ch.is_alpha then
			if alp.index_of (ch, 1) - num + 1 > 0 then
				Result := alp.item (alp.index_of (ch, 1) - num + 1)
			else
				Result := alp.item (alp.count + alp.index_of (ch, 1) - num + 1)
			end
		else
			Result := ch
		end
	end

	encrypt(str: STRING; key: STRING): STRING
	local
		big_key: STRING
		upper: STRING
		upper_key: STRING
		char: CHARACTER
		key_ind: INTEGER
		key_char: CHARACTER
		tmp: INTEGER
		i: INTEGER
		res: STRING
		enc_char: CHARACTER
	do
		upper := str.as_upper
		print("%NVigenere encrypt string: " + upper + ", key: " + key + "%N")
		upper_key := only_alpha(key.as_upper)
		if upper.count > upper_key.count then
			tmp := str.count // upper_key.count + 1
			upper_key.multiply (tmp)
		end
		res := ""
		key_ind := 1
		from
			i := 1
		until
			i = upper.count + 1
		loop
			char := upper[i]
			key_char := upper_key[key_ind]
			enc_char := plus(char, key_char)
			res.append_character (enc_char)
			i := i + 1
			if char.is_alpha then
				key_ind := key_ind + 1
			end
		end
		Result := res
		Print("%NResult = " + res + "%N")
	end

	only_alpha(s: STRING): STRING
	local
		alp: STRING
		num: INTEGER
	do
		alp := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		Result := ""
		from
			num := 1
		until
			num = s.count + 1
		loop
			if s[num].is_alpha then
				Result.append_character(s[num])
			end
			num := num + 1
		end
	end


	decrypt(str: STRING; key: STRING): STRING
	local
		big_key: STRING
		upper: STRING
		upper_key: STRING
		char: CHARACTER
		key_ind: INTEGER
		key_char: CHARACTER
		tmp: INTEGER
		i: INTEGER
		res: STRING
		enc_char: CHARACTER
	do
		upper := str.as_upper
		upper_key := only_alpha(key.as_upper)
		if upper.count > upper_key.count then
			tmp := (str.count // upper_key.count + 1)
			upper_key.multiply (tmp)
		end
		print("%NVigenere decrypt string: " + upper + ", key: " + key + "%N")
		res := ""
		key_ind := 1
		from
			i := 1
		until
			i = upper.count + 1
		loop
			char := upper[i]
			key_char := upper_key[key_ind]
			enc_char := sub(char, key_char)
			res.append_character (enc_char)
			i := i + 1
			if char.is_alpha then
				key_ind := key_ind + 1
			end
		end
		Print("%NResult = " + res + "%N")
		Result := res
	end
end
