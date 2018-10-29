note
	description: "revers application root class"
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
			s:="1234665"

	i:=s.count
	print(rev(s,i))
		end
	i:INTEGER
	s: STRING

	rev(s1:STRING y:INTEGER):STRING

	 do
	 Result:=""
	 	if(y = i) then
	 	Result:=""
	 	end
	 	if(y/=0)
	 	then
	 		Result:=s1[y].out +rev(s1,y-1)
	end
	end

end
