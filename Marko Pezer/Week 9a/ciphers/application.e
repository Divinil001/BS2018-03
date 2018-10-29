class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	v: VIGENERE_CIPHER
	s: SPIRAL_CIPHER
	c: COMBINED_CIPHER

	make
	do
		create v
		create s
		create c.make

		io.put_string ("Coded message (VIGENERE): %N")
		print (v.encrypt("MY NAME IS MARKO!", "TIGER"))
		io.put_new_line
		io.put_new_line

		io.put_string ("Decoded message (VIGENERE): %N")
		print (v.decrypt ("FG TEDX QY QRKSU!", "TIGER"))
		io.put_new_line
		io.put_new_line

		io.put_string ("Coded message (SPIRAL): %N")
		print (s.encrypt("I AM FROM SERBIA!"))
		io.put_new_line
		io.put_new_line

		io.put_string ("Decoded message (SPIRAL): %N")
		print (s.decrypt ("  IASFI AMMB!EROR"))
		io.put_new_line
		io.put_new_line

		io.put_string ("Coded message (COMBINED): %N")
		print(c.encrypt ("I AM 19 YEAR OLD", "TIGER"))
		io.put_new_line
		io.put_new_line

		io.put_string ("Decoded message (COMBINED): %N")
		print(c.decrypt ("S ZUPU C B I9TV1", "TIGER"))
		io.put_new_line

	end

end
