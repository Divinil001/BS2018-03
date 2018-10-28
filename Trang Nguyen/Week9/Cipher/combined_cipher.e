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
	make (c1, c2: CIPHER)
		do
			create c.make (0)
			c.extend (c1)
			c.extend (c2)
		end

	c: ARRAYED_LIST [CIPHER]

	encrypt (text: STRING): STRING
		require
			text_not_empty: not text.is_empty
			c_not_empty: not c.is_empty
		local
			i: INTEGER
		do
			Result := text
			from i := 1
			until i > c.count
			loop
				Result := c[i].encrypt (Result)
				i := i + 1
			end
		end

	decrypt (text: STRING): STRING
		require
			text_not_empty: not text.is_empty
			c_not_empty: not c.is_empty
		local
			i: INTEGER
		do
			Result := text
			from i := c.count
			until i < 1
			loop
				Result := c[i].decrypt (Result)
				i := i - 1
			end
		end

end
