note
	description: "matrix_oper application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	i, j, k, x: INTEGER
	matrix1, matrix2: ARRAY2[INTEGER];

	make
		do
			create matrix1.make_filled (0, 2, 2)
			matrix1.put (2, 1, 1)
			matrix1.put (3, 1, 2)
			matrix1.put (2, 2, 1)
			matrix1.put (5, 2, 2)

			create matrix2.make_filled (0, 2, 2)
			matrix2.put (-1, 1, 1)
			matrix2.put (3, 1, 2)
			matrix2.put (-5, 2, 1)
			matrix2.put (4, 2, 2)

			io.put_string ("Matrix A: %N%N")

			from i := 1
			until i > 2
			loop
				from j := 1
				until j > 2
				loop
					io.put_string (matrix1.item(i, j).out + " ")
					j := j + 1
				end
				io.put_new_line
				i := i + 1
			end

			io.put_string ("%NMatrix B: %N%N")

			from i := 1
			until i > 2
			loop
				from j := 1
				until j > 2
				loop
					io.put_string (matrix2.item(i, j).out + " ")
					j := j + 1
				end
				io.put_new_line
				i := i + 1
			end

			io.put_string ("%NMatrix A + B: %N%N")
			print_sum (2, 2)

			io.put_string ("%NMatrix A - B: %N%N")
			print_minus (2, 2)

			io.put_string ("%NMatrix A x B: %N%N")
			print_product (2, 2, 2, 2)

			io.put_string ("%NDeterminant of A is: ")
			print_det (2, 2)
			io.put_new_line
		end

feature

	print_sum (m, n: INTEGER)
	require
		Dimensions: m >= 1 and n >= 1
	do
		from i := 1
		until i > m
		loop
			from j := 1
			until j > n
			loop
				io.put_string ((matrix1.item(i, j) + matrix2.item(i, j)).out + " ")
				j := j + 1
			end
			io.put_new_line
			i := i + 1
		end
	end

	print_minus (m, n: INTEGER)
	require
		Dimensions: m >= 1 and n >= 1
	do
		from i := 1
		until i > m
		loop
			from j := 1
			until j > n
			loop
				io.put_string ((matrix1.item(i, j) - matrix2.item(i, j)).out + " ")
				j := j + 1
			end
			io.put_new_line
			i := i + 1
		end
	end

	print_product (m, n, m2, n2: INTEGER)
	require
		Dimensions: n = m2
	do
		from i := 1
		until i > m
		loop
			from j := 1
			until j > n2
			loop
				x := 0

				from k := 1
				until k > n
				loop
					x := x + (matrix1.item (i, k) * matrix2.item (k, j))
					k := k + 1
				end
				io.put_string (x.out + " ")
				j := j + 1
			end
			io.put_new_line
			i := i + 1
		end
	end

	print_det (m, n: INTEGER)
	require
		Dimensions: m = n and (n = 2 or n = 3)
	do
		if n = 2 then
			io.put_string ((matrix1.item (1, 1) * matrix1.item (2, 2) - matrix1.item (1, 2) * matrix1.item (2, 1)).out + " %N")
		end
	end

end
