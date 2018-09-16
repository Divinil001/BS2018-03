class
	VECTOR_OPER
feature
	cross_product(v1, v2: ARRAYED_LIST[INTEGER]): ARRAYED_LIST[INTEGER]
		require
			is_tridimentional_vector: v1.count = 3 and v2.count = 3
		local
			answer: ARRAYED_LIST[INTEGER]
		do
			create answer.make (0)
			answer.force (v1[2] * v2[3] - v1[3] * v2[2])
			answer.force (v1[3] * v2[1] - v1[1] * v2[3])
			answer.force (v1[1] * v2[2] - v1[2] * v2[1])
			Result := answer
		end

	dot_product(v1, v2: ARRAYED_LIST[INTEGER]): INTEGER
		require
			is_equal: v1.count = v2.count
		local
			i: INTEGER
		do
			Result := 0
			from i := 1
			until i > v1.count
			loop
				Result := Result + v1[i]*v2[i]
				i := i + 1
			end
		end

	triangle_area (v1, v2: ARRAYED_LIST[INTEGER]): DOUBLE
		local
			new_vector: ARRAYED_LIST[INTEGER]
			math: DOUBLE_MATH
		do
			create math
			create new_vector.make (0)
			new_vector := cross_product (v1, v2)
			Result := new_vector[1] * new_vector[1] + new_vector[2] * new_vector[2] + new_vector[3] * new_vector[3]
			Result := math.sqrt(Result)
			Result := Result / 2
		end
end
