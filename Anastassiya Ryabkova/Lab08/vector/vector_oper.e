note
	description: "Summary description for {VECTOR_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR_OPER

	create make

	feature
		make
			do

			end
		cross_product(v1,v2: ARRAY[INTEGER]):ARRAY[INTEGER]
				do
				create Result.make_empty

				Result.force (v1[2]*v2[3]-v1[3]*v2[2], Result.count + 1)
				Result.force (v1[3]*v2[1]-v1[1]*v2[3], Result.count + 1)
                Result.force (v1[1]*v2[2]-v1[2]*v2[1], Result.count + 1)
			end

		doc_product(v1,v2: ARRAY[INTEGER]):INTEGER
		require v1_equal_v2: v1.count = v2.count
			do
				Result:= v1[1]*v2[1] + v1[2]*v2[2] + v1[3]*v2[3]
			end

		triangle_area (v1: ARRAY [INTEGER]; v2: ARRAY [INTEGER]): REAL_64
		local
			cross: ARRAY [INTEGER]
			i: INTEGER
		do

			Result := 0
			create cross.make_from_array (cross_product (v1, v2))

			from
				i := 1

			until
				i > 3
			loop

				Result := Result + cross.item (i).to_double * cross.item (i).to_double
				i := i + 1
			end

			Result := sqrt (Result) / 2

		end

end
