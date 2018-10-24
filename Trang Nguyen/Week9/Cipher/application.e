note
	description: "cipher application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			c: COMBINED_CIPHER
			c1: VIGENERE_CIPHER
			c2: SPIRAL_CIPHER
			text: STRING
		do
			--| Add your code here
			create c1
			create c2
			create c.make (c1, c2)
			text := "STUDENTS, SOLVE THE ASSIGNMENT WELL AND FAST!"
			text := c1.encrypt (text)
			print (text)
			io.new_line
			text := c2.encrypt (text)
			print (text)
			io.new_line
			text := c.decrypt (text)
			print (text)
			io.new_line
		end

end
