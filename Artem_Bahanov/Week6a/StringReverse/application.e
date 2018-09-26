note
	description: "StringReverse application root class"
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
		do
			print (reverse_recur("%Nlorem ipsum dolor sit amet"))
			print (reverse_iter("%Nlorem ipsum dolor sit amet"))
		end


feature
	reverse_iter(s: STRING): STRING -- iterative algorithm
	local
		i, c: INTEGER
	do
		Result := ""
		c := s.count
		from
			i := 0
		until
			i >= c
		loop
			Result.extend(s.item (c - i))
			i := i + 1;
		end
	end

	reverse_recur(s: STRING): STRING -- recursive algorithm
	do
		Result := ""
		if s.count = 1 then
			Result := s
		else
			Result.extend(s.item(s.count))
			Result.append(reverse_recur(s.substring (1, s.count - 1)))
		end
	end
end
