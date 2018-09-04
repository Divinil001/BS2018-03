note
	description : "university application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	COURSE

inherit
	ARGUMENTS

create
	create_class

feature {NONE} -- Initialization

	create_class
			-- Run application.
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")
		end

end
