note
	description: "Summary description for {COMBINED_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMBINED_CIPHER

inherit
	CIPHER

create
	init

feature
	a : ARRAYED_LIST[CIPHER]

feature
	init
		do
			create a.make (0)
		end
	add (ad : CIPHER)
		do
			a.extend (ad)
		end
	encrypt (in : STRING; pas : STRING) : STRING
		local
			i : INTEGER
		do
			Result := in
			from i := 1 until i > a.count loop
				Result := a[i].encrypt(Result, pas)
				i := i + 1
			end
		end
	decrypt (in : STRING; pas : STRING) : STRING
		local
			i : INTEGER
		do
			Result := in
			from i := a.count until i < 1 loop
				Result := a[i].decrypt(Result, pas)
				i := i - 1
			end
		end

end
