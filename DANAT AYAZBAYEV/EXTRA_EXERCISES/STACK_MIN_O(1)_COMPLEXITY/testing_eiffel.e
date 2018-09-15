note
	description: "TESTING_EIFFEL application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	TESTING_EIFFEL

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			a : ARRAYED_LIST[INTEGER]
		do
			create a.make (0)
			a.extend (1)
			a.extend (3)
			a.move (1)
			a.remove
			print(a[1])
		end

end
