note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	a : COMBINED_CIPHER
	vig : VIGENERE_CIPHER
	spi : SPIRAL_CIPHER
	mes : STRING
	pas : STRING

feature {NONE}
	make
		do
			create a.init
			create vig
			create spi
			mes := "MYLASTASSIGNMENT"
			pas := "BUSY"
			a.add(vig)
			a.add(spi)
			pas := a.encrypt(mes, pas)
			mes := "LAGHYH QSCUJRKS.IRNTEFRPRXMOIY CGAEYXWYGNENLRF   FAZ2/TGBZKFIREE.RWD Y LU! LMK SLXG.E./PMAWUHWHCGYZGYFHEIWG QUG RSS.XUVIULZIE KFYGEL//:RLH DXE Z"
			print(a.decrypt(mes, pas))
		end

end
