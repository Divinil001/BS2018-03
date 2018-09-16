note
	description: "REMOVING_DUPLICATES application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	REMOVING_DUPLICATES

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			a : LINKED_LIST[INTEGER]
			n : INTEGER
			i : INTEGER
			j : INTEGER
		do
			create a.make
			io.read_integer
			n := io.last_integer
			from i := 1 until i > n loop
				io.read_integer
				a.extend (io.last_integer)
				i := i + 1
			end
			from i := 1 until i > a.count loop
				a.forth
				from j := i + 1 until j > a.count loop
					if a.at (j) = a.item_for_iteration then
						a.remove
						j := i
					end
					j := j + 1
				end
				i := i + 1
			end
			a.start
			from i := 1 until i > a.count loop
				i := i + 1
				print(a.item_for_iteration.out + " ")
				a.forth
			end
		end
end
