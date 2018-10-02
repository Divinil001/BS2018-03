note
	description: "reversing application root class"
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
			print(reverse("Adventure"))
		end

feature
	reverse(s: STRING): STRING
		local
			i: INTEGER
		do
			Result:=""
			from
				i:=s.count
			until
				i<1
			loop
				Result.extend (s.item (i))
				i:=i-1
			end
		end
end
