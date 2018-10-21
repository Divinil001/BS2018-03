note
	description: "ciphers application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	co: COMBINED_CIPHER
	--encrypted_spir: STRING
	k: STRING
	make
			-- Run application.
		do
			create co.make
			-- Using only combinating because it is using all ciphers
			k := co.encrypt("STUDENTS, SOLVE THE ASSIGNMENT WELL AND FAST!", "TIGER")
			k := co.decrypt (k, "TIGER")
		end

end
