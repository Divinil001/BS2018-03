note
	description: "hanoi application root class"
	date: "$Date$"
	revision: "$Revision$"

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
			tower(2, 'a','c','b')
		end

	tower(n : INTEGER; source, target, other : CHARACTER)
		do
			if n = 1 then
				print(source.out + " to " + target.out + "%N")
			else
				tower(n-1, source, other, target)
			    print(source.out + " to " + target.out + "%N")
			    tower(n-1, other, target, source)
			end
		end

end
