class
	COMBINED_CIPHER
inherit
	KEYED_CIPHER
create
	make

feature
	make
	do
		create s
		create v
	end
	
	encrypt(text, key: STRING): STRING
	do
		Result := s.encrypt(v.encrypt(text, key))
	end

	decrypt(text, key: STRING): STRING
	do
		Result := v.decrypt(s.decrypt(text), key)
	end
feature{COMBINED_CIPHER}
	s: SPIRAL_CIPHER
	v: VIGENERE_CIPHER
end
