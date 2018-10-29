class
	COMBINED_CIPHER

inherit
	KEYED_CIPHER

create
	make

feature {COMBINED_CIPHER}

	spiral: SPIRAL_CIPHER
	vigenere: VIGENERE_CIPHER

feature

	make
	do
		create spiral
		create vigenere
	end

	encrypt (t: STRING; k: STRING): STRING
	do
		Result := spiral.encrypt(vigenere.encrypt(t, k))
	end

	decrypt (t: STRING; k: STRING): STRING
	do
		Result := vigenere.decrypt(spiral.decrypt(t), k)
	end

end
