class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			print ("Enter string to get all anagrams%N")
			from

			until
				False
			loop
				io.read_line
				print("Here your anagrams:%N")
				get_anagrams(io.last_string, 1, io.last_string.count)
				print("___%N")
			end
		end

	get_anagrams(a: STRING l, r: INTEGER)
	require
		a.count > 0
	local
		t0: CHARACTER
		i: INTEGER
	do
		if l = r then
			print(a + "%N")
		else
			from
				i := l
			until
				i > r
			loop
				t0 := a[l]
				a[l] := a[i]
				a[i] := t0
				get_anagrams(a, l + 1, r)
				t0 := a[l]
				a[l] := a[i]
				a[i] := t0
				i := i + 1
			end

		end
	end
end
