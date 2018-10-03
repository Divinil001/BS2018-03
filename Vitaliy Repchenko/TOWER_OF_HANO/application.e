note
	description: "TOWER_OF_HANO application root class"
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
			--| Add your code here
			Tower_of_Hanoi(4)
		end


feature
	Solve(n: INTEGER; a,b,c: STRING)
		do
			if n>0 then
				Solve(n-1,a,c,b)
				print("%N")
				print("Move the disk from the rod " + a + " to the rod " + b)
				Solve(n-1,c,b,a)
			end
		end
	Tower_of_Hanoi(n: INTEGER)
		do
			Solve(n, "First", "Second", "Third")
		end
end
