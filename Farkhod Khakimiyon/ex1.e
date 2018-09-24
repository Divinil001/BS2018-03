class
	EX1

create
	make

feature
	s: STRING
	make(s1: STRING)
	do
		s := s1
	end

	rev(x: INTEGER)
	do
		if x < s.count then
			rev(x + 1)
		end
		print(s[x])
	end

end
