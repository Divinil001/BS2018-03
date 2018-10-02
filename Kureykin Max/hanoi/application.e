note
	description: "hanoi application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			han(3,'A','B','C')
		end

	han(n:INTEGER; source, target, other:CHARACTER)
	require
		pos_n: n >= 0
		d1: source /= target
		d2: source /= other
		d3: target /= other
	do
		if n > 0 then
			han(n - 1, source, other, target)
			move(source, target)
			han(n - 1, other, target, source)
		end
	end

	move(source, target:CHARACTER)
	require
		diff: source /= target
	do
		print(source.out + "->" + target.out + "%N")
	end

end
