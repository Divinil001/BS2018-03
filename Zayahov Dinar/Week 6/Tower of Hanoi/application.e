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

feature
	count: INTEGER

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			hanoi(4, 'A','B','C')
			print(count)
		end

feature
	hanoi(n: INTEGER; source, target, other: CHARACTER)
		do
			if
				n>0
			then
				hanoi(n-1, source, other, target)
				move(source, target)
				hanoi(n-1, other, target, source)
			end
		end

	move(source, target: CHARACTER)
		do
			io.put_character (source)
			io.put_string (" to ")
			io.put_character (target)
			io.put_new_line
			count:=count+1
		end

end
