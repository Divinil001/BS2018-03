class
	APPLICATION

create
	make

feature
	a: STRING
	make
		do
		Io.put_string ("Put your string: ")
		Io.read_line
		a := Io.last_string
		print(reversing_iterative(a))
		print("%N")
		print(reversing_recursive(a))
		end
	reversing_iterative(a_: STRING):STRING
	local
		i: INTEGER
	do
		Result := ""
		from
			i := a_.count
		until
			i < 1
		loop
			Result.append (a_[i].out)
			i := i - 1
		end
	end

	reversing_recursive(a_:STRING):STRING
	do
		if
			a_.count = 1
		then
			Result := a_
		else
			Result := a_[a_.count].out + reversing_recursive(a_.substring (1, a_.count - 1))
		end
	end
end
