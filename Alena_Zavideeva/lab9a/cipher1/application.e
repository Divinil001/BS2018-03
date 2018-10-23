class
	APPLICATION

create
	make

feature
	cipher_vigenere: VIGENERE_CIPHER
	cipher_caesar : CAESAR_CIPHER
	cipher_spiral : SPIRAL_CIPHER
	combined_cipher : COMBINED_CIPHER
	s, k, pass_phrase, message, code: STRING
	make
		do
			create cipher_vigenere.make("TIGER")
			create cipher_caesar.make(3)
			create cipher_spiral.make
			Io.put_string ("TEXT TO ENCRYPT: ")
			Io.read_line
			s := Io.last_string.out
			k := cipher_vigenere.encrypt(s)
			Io.put_string ("ENCRYPTED TEXT BY VIGENERE CIPHER: " + k + "%N")
			Io.put_string ("DECRYPTED TEXT BY VIGENERE CIPHER: " + cipher_vigenere.decrypt(k)+ "%N")

			k := cipher_caesar.encrypt (s)
			Io.put_string ("ENCRYPTED TEXT BY CARSAR CIPHER: " + k + "%N")
			Io.put_string ("DECRYPTED TEXT BY CARSAR CIPHER: " + cipher_caesar.decrypt(k)+ "%N")

			k := cipher_spiral.encrypt(s)
			Io.put_string ("ENCRYPTED TEXT BY SPIRAL CIPHER: " + k + "%N")
			Io.put_string ("DECRYPTED TEXT BY SPIRAL CIPHER: " + cipher_spiral.decrypt (k) + "%N")

			Io.put_string ("Pass phrase: ")
			Io.read_line
			pass_phrase := Io.last_string.out

			Io.put_string ("Message: ")
			Io.read_line
			message := Io.last_string.out

			create cipher_vigenere.make (pass_phrase)
			create combined_cipher.make

			combined_cipher.add_cipher(cipher_vigenere)
			combined_cipher.add_cipher(cipher_spiral)

			k := combined_cipher.encrypt(message)
			Io.put_string ("Pass phrase: " + k + "%N")

			Io.put_string ("Code: ")
			Io.read_line
			code := Io.last_string.out

			create cipher_vigenere.make (k)
			create combined_cipher.make

			combined_cipher.add_cipher(cipher_vigenere)
			combined_cipher.add_cipher(cipher_spiral)

			Io.put_string ("Decrypted code: " + combined_cipher.decrypt (code) + "%N")



		end

end
