note
	description: "lab13 application root class"
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
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")
		end

end
