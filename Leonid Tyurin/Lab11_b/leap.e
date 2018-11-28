class
	LEAP

inherit

	ARGUMENTS_32

create
	make

feature
	make
		local
			m: INTEGER
		do
			io.readint
			m := io.lastint
			io.put_boolean (not ((m \\ 4 /= 0) or else (m.integer_remainder (100) = 0 and m.integer_remainder (400) /= 0)))
		end

end
