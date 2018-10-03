note
	description: "Recursion_Exercize_1 application root class"
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
			a:=""
			s:=""
			k:=' '
			io.read_line
			set_s(io.last_string)
			print(first_mirror)
			a:=""

			print("%N"+recursion_mirror(s)+"%N")

		end
feature
	set_s(s_1: STRING)
		do
			s:=s_1
		end
	first_mirror: STRING
		do
			from
				i:= s.count
			until
				i = 0
			loop
				a := a + s[i].out
				i := i-1
			end
			Result := "%N"+a+"%N"
		end


recursion_mirror(s_1 : STRING): STRING
	do
		Result:=""
		if s_1.count=1 then
			Result:=s_1[1].out
		else
			Result:=Result+recursion_mirror(s_1.substring (2, s_1.count))
			Result:=Result + s_1[1].out
		end
	end

feature
	s, a :STRING
	i : INTEGER
	k : CHARACTER
end
