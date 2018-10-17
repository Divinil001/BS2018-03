deferred class
	KEYED_CIPHER
inherit
	CIPHER
feature
	decrypt(text, key: STRING): STRING
	require
		is_key_valid(key)
	deferred
	end

	encrypt(text, key: STRING): STRING
	require
		is_key_valid(key)
	deferred
	end

	is_key_valid(key: STRING): BOOLEAN
	local
		i: INTEGER
	do
		Result := True
		from
			i := 1
		until
			i > key.count
		loop
			if key.code (i).to_integer_32 < start or key.code (i).to_integer_32 >= start + size then
				Result := False
			end
			i := i + 1
		end
	end
end
