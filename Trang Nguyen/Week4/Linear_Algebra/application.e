note
	description: "Linear_Algebra application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS
	MATRIX_OPER
	VECTOR_OPER

create
	make

feature {NONE} -- Initialization

	make
		do
		    -- Vetor
		    print ("%NVECTOR OPERATION%N")
			-- Initialize
			print ("%NVector v1: %N")
			create v1.make_filled (0, 1, 3)
			v1.copy (create_vector)
			print_vector (v1)
			print ("%NVector v2: %N")
			create v2.make_filled (0, 1, 3)
			v2.copy (create_vector)
			print_vector (v2)
			-- Operation
			print ("%NDot product: v1.v2 = " + dot_product (v1, v2).out)
			print ("%NCross product: v1 * v2 = ")
			print_vector (cross_product (v1, v2))
			print ("Triangle's area: " + triangle_area (v1, v2).out)

			-- Matrix
			print ("%N%NMATRIX OPERATION%N")
			-- Initialize
			create m1.make_filled (0, 1, 1)
			create m2.make_filled (0, 1, 1)
			print ("Matrix 1: %N")
			m1.copy (create_matrix)
			print_matrix (m1)
			print ("%NMatrix 2: %N")
			m2.copy (create_matrix)
			print_matrix (m2)
			-- Deterninant
			print ("%NDet (m1): " + det (m1).out)
			print ("%NDet (m2): " + det (m2).out)
			-- Multiply
			print ("%N%Nm1.m2: %N")
			print_matrix (prod (m1, m2))
			-- Substract
			print ("m1 - m2: %N")
			print_matrix (minus (m1, m2))
			-- Addition
			print ("m1 + m2: %N")
			print_matrix (add (m1, m2))


		end

feature -- Access

	m1, m2: ARRAY2 [INTEGER]
			-- Matrices

	v1, v2: ARRAY [INTEGER]
			-- Vectors

	print_vector (v: ARRAY [INTEGER])
			-- Print vector
		do
			print ("(" + v.item (1).out + ", " + v.item (2).out + ", " + v.item (3).out + ")%N")
		end

	print_matrix (m: ARRAY2 [INTEGER])
			-- Print matrix
		local
			i, j: INTEGER
		do
			from i := 1
			until i > m.height
			loop
				from j := 1
				until j > m.width
				loop
					print (m.item (i, j).out + "%T")
					j := j + 1
				end
				io.new_line
				i := i + 1
			end
			io.new_line
		end

	create_vector: ARRAY [INTEGER]
			-- Create an array
		local
			i: INTEGER
			invalid: BOOLEAN
		do
			create Result.make_filled (0, 1, 3)
			from i := 1
			until i > 3
			loop
				from invalid := True
				until invalid = False
				loop
					print ("Enter coordinate no." + i.out)
					io.new_line
					io.read_line
					if io.last_string.is_integer then
						Result.put (io.last_string.to_integer, i)
						invalid := False
					end
				end
				i := i + 1
			end
		end

	create_matrix: ARRAY2 [INTEGER]
			-- Create matrix
		local
			row, col, i, j: INTEGER
			invalid: BOOLEAN
		do
			from invalid := True
			until invalid = False
			loop
				print ("Enter number of rows: %N")
				io.read_line
				if io.last_string.is_integer then
					if io.last_string.to_integer > 1 then
						row := io.last_string.to_integer.abs
						invalid := False
					end
				end
			end
			from invalid := True
			until invalid = False
			loop
				print ("Enter number of colums: %N")
				io.read_line
				if io.last_string.is_integer then
					if io.last_string.to_integer > 1 then
						col := io.last_string.to_integer.abs
						invalid := False
					end
				end
			end
			create Result.make_filled (0, row, col)
			from i := 1
			until i > row
			loop
				from j := 1
				until j > col
				loop
					from invalid := True
					until invalid = False
					loop
						print ("Enter element " + i.out + j.out)
						io.new_line
						io.read_line
						if io.last_string.is_integer then
							Result.put (io.last_string.to_integer, i, j)
							invalid := False
						end
					end
					j := j + 1
				end
				i := i + 1
			end
		end

invariant
	v1_attached: v1.count = 3
	v2_attached: v1.count = 3
end
