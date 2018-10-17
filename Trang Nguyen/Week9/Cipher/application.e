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
			text: STRING
		do
			--| Add your code here
			create c.make
			text := c.encrypt ("STUDENTS, SOLVE THE ASSIGNMENT WELL AND FAST!")
			io.new_line
			print (text)
			io.new_line
			text := c.decrypt ("BDIICR !BL EYKYLBAHVGE SPJ JVTMW , WFXVKE ZXYZ")
			print (text)
		end

end
