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
	make

feature

	make
		do
			create c1.make
			create c2.make
		end

	c1: VIGENERE_CIPHER
	c2: SPIRAL_CIPHER

	encrypt (text: STRING): STRING
		require else
			text_not_empty: not text.is_empty
		do
			Result := text
			Result.to_upper
			Result := c1.encrypt (Result)
			Result := c2.encrypt (Result)
		ensure then
			length_equal: text.count = Result.count
		end

	decrypt (text: STRING): STRING
		require else
			text_not_empty: not text.is_empty
		do
			Result := text
			Result.to_upper
			Result := c2.decrypt (Result)
			Result := c1.decrypt (Result)
		ensure then
			length_equal: text.count = Result.count
		end

end
