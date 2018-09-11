class
	GAME
feature
	m, n: INTEGER
feature
	create_field( a_m, a_n :INTEGER): FIELD
		local
			qwerty: FIELD
		do
			create qwerty.make(a_m, a_n)
			Result:= qwerty
		end
	check_field()
		do
			io.put_string("%N"+"Rows: ")
			io.read_integer
			m:= io.last_integer+0
			print("%N"+"Colomns: ")
			io.read_integer
			n:= io.last_integer+0
		end
end
