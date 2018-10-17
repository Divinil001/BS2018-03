class
	SPIRAL_CIPHER

inherit
	UNKEYED_CIPHER
feature
	print_matrix(matrix: ARRAY2[ANY])
	local i, j: INTEGER
 	do
		from i := 1 until i > matrix.height loop
			from j := 1 until j > matrix.width loop
				print("["+matrix[i, j].out + "] ")
				j := j + 1
			end
			io.put_new_line
			i := i + 1
		end
	end

feature
	encrypt(message: STRING): STRING
	local matrix_size, i, j, start_block, end_block, dim: INTEGER
		  matrix: ARRAY2[STRING]
	do
		result := ""
		from matrix_size := 1 until matrix_size*matrix_size >= message.count loop
			matrix_size := matrix_size + 1
		end

		create matrix.make_filled ("", matrix_size, matrix_size)
		from i := 0 until i > message.count  - 1 loop
			matrix[i//matrix_size+1, i\\matrix_size+1] := message[i+1].out
			i := i + 1
		end
		--print_matrix(matrix)

		start_block := 0
		end_block := 0
		dim := matrix.height
		from until start_block + 1 > dim-end_block loop
			from i := 1 + start_block until i > dim-end_block loop
				result.append(matrix[i, dim-end_block])
				i := i + 1
			end
			end_block := end_block + 1
			from j := dim - end_block until j < start_block+1 loop
				result.append(matrix[dim-start_block, j])
				j := j - 1
			end
			from i := dim - end_block until i < start_block+1 loop
				result.append(matrix[i, start_block+1])
				i := i - 1
			end
			start_block := start_block + 1
			from j := 1 + start_block until j > dim-end_block loop
				result.append(matrix[start_block, j])
				j := j + 1
			end
		end
		--print_matrix(matrix)
	end

	decrypt(message: STRING): STRING
	local matrix_size, i, j, start_block, end_block, dim, empty_space, msg_count, digit: INTEGER
		  matrix: ARRAY2[STRING]
		  number_matrix: ARRAY2[INTEGER]
	do

		result := ""
		msg_count := 1
		digit := 1
		from matrix_size := 1 until matrix_size*matrix_size >= message.count loop
			matrix_size := matrix_size + 1
		end

		create matrix.make_filled ("", matrix_size, matrix_size)
		create number_matrix.make_filled (0, matrix_size, matrix_size)
		from i := 1 until i > matrix_size loop
			from j := 1 until j > matrix_size loop
				number_matrix[i, j] := digit
				digit := digit + 1
				j := j + 1
			end
			i := i + 1
		end
		--print_matrix(number_matrix)
		empty_space := matrix_size - (matrix_size*matrix_size - message.count)
		start_block := 0
		end_block := 0
		dim := matrix.height
		from until start_block + 1 > dim-end_block loop
			from i := 1 + start_block until i > dim-end_block loop
				if number_matrix[i, dim-end_block] <= message.count then
					matrix[i, dim-end_block] := message[msg_count].out
					msg_count := msg_count + 1
				end
				--print_matrix(matrix)

				i := i + 1
			end
			end_block := end_block + 1
			from j := dim - end_block until j < start_block+1 loop
				if number_matrix[dim-start_block, j] <= message.count then
					matrix[dim-start_block, j] := message[msg_count].out
					msg_count := msg_count + 1
				end
				--print_matrix(matrix)

				j := j - 1
			end
			from i := dim - end_block until i < start_block+1 loop
				if number_matrix[i, start_block+1] <= message.count then
					matrix[i, start_block+1] := message[msg_count].out
					msg_count := msg_count + 1
				end
				--print_matrix(matrix)

				i := i - 1
			end
			start_block := start_block + 1
			from j := 1 + start_block until j > dim-end_block loop
				if number_matrix[start_block, j] <= message.count then
					matrix[start_block, j] := message[msg_count].out
					msg_count := msg_count + 1
				end
				--print_matrix(matrix)

				j := j + 1
			end
			--print_matrix(matrix)
		end
		--print_matrix(matrix)
		from i := 1 until i > dim loop
			from j := 1 until j > dim loop
				result.append (matrix[i, j].out)
				j := j + 1
			end
			i := i + 1
		end
	end
end
