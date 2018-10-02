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

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			print (reverse("raniD"))
		end

feature
	reverse(s: STRING): STRING
		do
			Result:=""
			if
				s.count=1
			then
				Result:=s
			else
				Result.extend(s.item (s.count))
				s.remove (s.count)
				Result.append(reverse(s))
			end
		end

end
