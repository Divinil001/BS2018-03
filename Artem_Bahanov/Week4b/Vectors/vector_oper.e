class
	VECTOR_OPER
inherit
	DOUBLE_MATH

	feature
		cross_product(v1, v2: ARRAY[INTEGER]): ARRAY[INTEGER]
		require
			corr_size: v1.count = 3 and v2.count = 3
		do
			create Result.make_empty
			Result.force (v1.item (2) * v2.item (3) - v1.item (3) * v2.item (2), 1)
			Result.force (v1.item (1) * v2.item (3) - v1.item (3) * v2.item (1), 2)
			Result.force (v1.item (1) * v2.item (2) - v1.item (2) * v2.item (1), 3)
		end

		dot_product(v1, v2: ARRAY[INTEGER]): INTEGER
		require
			corr_size: v1.count = v2.count
		local
			i: INTEGER
		do
			from
				Result := 0
				i := 1
			until
				i > v1.count
			loop
				Result := Result + v1.item (i) * v2.item (i)
				i := i + 1
			end
		end

		triangle_area(v1, v2: ARRAY [INTEGER]): DOUBLE
		local
			v: ARRAY[INTEGER]
		do
			v := cross_product(v1, v2)
			result := sqrt(v.item(1) * v.item(1) + v.item(2) * v.item(2) + v.item(3) * v.item(3)) / 2
		end

	print_vector(v1: ARRAY[INTEGER]): STRING
	require
		size: v1.count = 3
	do
		Result := "[ "
		across v1 as it
		loop
			Result.append(it.item.out + " ")
		end
		Result.append ("]")
	end
end
