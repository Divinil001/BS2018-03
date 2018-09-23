class
	APPLICATION

create
	make

feature
	r1, r2, test : RANGES_OF_NUMBERS
	make
		do
			create r1.make(1,5)
			create r2.make(4,5)

			Io.put_string ("R1 is empty")
			print(r1.is_empty)
			Io.put_string ("%N")

			Io.put_string ("r1 is_sub_range_of r2: ")
			print(r1.is_sub_range_of (r2))
			Io.put_string ("%N")

			Io.put_string ("r1 - r2   ")
			create test.make (4,3)
			test := r1.subtract(r2)
			print(test.left)
			print(" ")
			print(test.right)
			print("%N")



			Io.put_string ("r1 + r2   ")
			test := r1.add(r2)
			print(test.left)
			print(" ")
			print(test.right)
			print("%N")


		end

end
