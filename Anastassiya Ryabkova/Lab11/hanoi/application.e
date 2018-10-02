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
	num:INTEGER
	make
			-- Run application.
		do
			--| Add your code here

			num
			:=4
			honoi(num, 'A', 'C', 'B')
		end

		honoi(n:INTEGER; source, target, other: CHARACTER)
			do
				if
					n = 1
				then
					print("Move disk 1 from " + source.out + " to road " + other.out)
				end
				honoi(n-1, source, other, target)
				print("Move disk " + n.out + " from " + source.out + " to road " + other.out)
				honoi(n-1, other, target, source)

			end




end
