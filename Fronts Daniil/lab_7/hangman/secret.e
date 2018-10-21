note
	description: "Summary description for {SECRET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SECRET

create
	make

feature
	make(st: STRING)
	local
		tmp: STRING
	do
		tmp := "_"
		s := st
		tmp.multiply (s.count)
		printable := tmp
		mistakes := 0
	end

	guess(ch: CHARACTER)
	local
		i: INTEGER
		exists: BOOLEAN
	do
		print("Called with ch: " + ch.out + "%N")
		exists := False
		from
			i := 1
		until
			i = s.count + 1
		loop
			if s[i] = ch then
				exists := True
				printable.put (ch, i)
			end
			i := i + 1
		end
		if not exists and ch.is_alpha then
			mistakes := mistakes + 1
		end
	end

feature
	s: STRING
	printable: STRING
	mistakes: INTEGER

end
