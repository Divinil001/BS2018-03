class
	COMBINED_CIPHER
inherit CIPHER
create make

feature
	a: ARRAY[CIPHER]

	make
		do
			create a.make_empty
		end

	add_cipher(cipher: CIPHER)
		do
			a.force(cipher, a.count + 1)
		end

feature
	encrypt(str : STRING): STRING
		local
			i : INTEGER
		do
			from
				i:= 1
				Result := str
			until
				i > a.count
			loop
				Result := a[i].encrypt(Result)
				i := i + 1
			end
		end

	decrypt(str : STRING): STRING
		local
			i : INTEGER
		do
			from
				i:= a.count
				Result := str
			until
				i < 1
			loop
				Result := a[i].decrypt(Result)
				i := i - 1
			end
		end
end
