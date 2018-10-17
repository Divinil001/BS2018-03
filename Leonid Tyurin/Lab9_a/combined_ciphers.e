note
	description: "Summary description for {COMBINED_CIPHERS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMBINED_CIPHERS
inherit
	CIPHER
create
	make

feature

	c1 : VIGENERE_CIPHER
	c2 : SPIRAL_CIPHER

	make
		do
			create c1
			create c2
		end

	encrypt(msg, useless : STRING) : STRING
		local
			res : STRING
		do
			res := c1.encrypt(msg, useless)
			res := c2.encrypt (res, "")
			result := res
		end

	decrypt(msg, useless : STRING) : STRING
		local
			res : STRING
		do
			res := c2.decrypt (msg, useless)
			res := c1.decrypt (res, useless)
			result := res
		end

end
