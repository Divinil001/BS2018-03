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
	arr : ARRAYED_LIST[SCIENTIST]

feature
	add_member (mem : SCIENTIST)
		do
			arr.extend(mem)
		end
	introduce_all
		local
			i : INTEGER
		do
			from i := 1 until i > arr.count loop
				print(arr[i].introduce + "%N")
				i := i + 1
			end
		end
	remove_member (i : INTEGER)
		do
			arr.go_i_th (i)
			arr.remove
		end


feature {NONE}
	make
		local
			a : BIOLOGIST
		do
			create arr.make (0)
			create a.initialize (123, "Someone", "Biologist:", "Cat")
			add_member(a)
			introduce_all
			remove_member(1)
			print(arr.count)
		end

end
