class
	COURSE

create
	create_class
feature


	name:STRING

	identifier:INTEGER

	schedule:STRING

	max_num_of_students:INTEGER

	set_idenf(n:INTEGER)
		do
			identifier := n

		end

	set_name(n:STRING)
		do
			name := n
		end

	set_schedule(n:STRING)
		do
			schedule := n
		end

	set_m(n:INTEGER)
		do
			max_num_of_students := n
		end

	start_num_of_students:INTEGER

	create_class(n:STRING; i:INTEGER; s:STRING; m:INTEGER; k:INTEGER)
		require
			k >= 3
		do
			set_name(n)
			set_idenf(i)
			set_schedule(s)
			set_m(m)
			start_num_of_students := k
		end
end
