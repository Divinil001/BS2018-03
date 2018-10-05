note
	description: "reverse_string application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature {NONE}

	make
		local
			str: STRING
		do
			str := "A very good string"
			str := reverse_string_iterative (str)
			print (str)
			print ("%N")
		end

	reverse_string (s: STRING): STRING
		local
			tmp: STRING
		do
			if s.count = 1 then
				Result := s
			else
				tmp := reverse_string (s.substring (2, s.count))
				tmp.append (s.substring (1, 1))
				Result := tmp
			end
		end

	reverse_string_iterative(s: STRING): STRING
	    local
	        tmp: STRING
	        i: INTEGER
	    do
	        tmp := ""
	        from
	            i := s.count
	        until
	            i = 0
	        loop
	            tmp.append(s.substring(i, i))
	            i := i - 1
	        end
	            Result := tmp

	    end

end
