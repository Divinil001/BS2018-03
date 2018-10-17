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

	make
		local
			c : SPIRAL_CIPHER
			c2 : VIGENERE_CIPHER
			str, t, temp: STRING
			temp2, temp3, temp4 : STRING
			a,b : INTEGER
			cm : COMBINED_CIPHERS
		do
			create c
			create c2
			create cm.make
			str := "LAGHYH QSCUJRKS.IRNTEFRPRXMOIY CGAEYXWYGNENLRF   FAZ2/TGBZKFIREE.RWD Y LU! LMK SLXG.E./PMAWUHWHCGYZGYFHEIWG QUG RSS.XUVIULZIE KFYGEL//:RLH DXE Z"
			print(cm.decrypt (str, "yqlrfynttnsdsycn"))
		end

end
