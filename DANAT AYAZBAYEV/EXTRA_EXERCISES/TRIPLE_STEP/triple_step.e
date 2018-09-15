note
	description: "TRIPLE_STEP application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	TRIPLE_STEP

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			n : INTEGER
			a : ARRAY[INTEGER]
			i : INTEGER
		do
			io.read_integer
			n := io.last_integer
			create a.make_filled (0, 0, n)
			a[0] := 1
			from
				i := 1
			until
				i > n
			loop
				if i - 2 >= 0 then
					a[i] := a[i] + a[i - 2]
				end
				if i - 3 >= 0 then
					a[i] := a[i] + a[i - 3]
				end
				a[i] := a[i] + a[i - 1]
				i := i + 1
			end
			print(a[n])
		end

end
