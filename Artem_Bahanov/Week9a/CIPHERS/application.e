note
	description: "CIPHERS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make	-- Run application.
	local
		v: VIGENERE_CIPHER
		s: SPIRAL_CIPHER
		c: COMBINED_CIPHER
		do
			create v -- test
			create s
			create c.make
			print(v.encrypt("STUDENTS, SOLVE THE ASSIGNMENT WELL AND FAST!", "TIGER"))
			io.put_new_line
			print(v.decrypt ("LBAHVGBY, WFEDK XYX IYWZZVSIEM EKPC TVJ JRLB!", "TIGER"))
			io.put_new_line
			print(v.encrypt ("HELLO, HOW ARE YOU?..", "TIGER"))
			io.put_new_line
			print(v.decrypt ("AMRPF, AWC EIX GUY?..", "TIGER"))
			io.put_new_line

			print(s.encrypt("Hello! How are you today?"))
			io.put_new_line
			print(s.decrypt ("ow t?yadoy !Helloe uoa Hr"))
			io.put_new_line

			print(c.encrypt ("Hello! How are you today?", "TIGER"))
			io.put_new_line
			print(c.decrypt ("ow t?yadoy !Aelloe uoa Pr", "TIGER"))
		end

end
