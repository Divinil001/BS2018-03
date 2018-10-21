note
	description: "Summary description for {COMBINED_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMBINED_CIPHER

create
	make

feature
	sc: SPIRAL_CIPHER
	vc: VIGENERE_CIPHER
	make
	do
		create sc
		create vc
	end

	encrypt(mes, key: STRING): STRING
	local
		tmp: STRING
	do
		tmp := vc.encrypt(mes, key)
		Result := sc.encrypt(tmp)
	end

	decrypt(msg, key: STRING): STRING
	local
		tmp: STRING
	do
		tmp := sc.decrypt(msg)
		Result := vc.decrypt (tmp, key)
	end

end
