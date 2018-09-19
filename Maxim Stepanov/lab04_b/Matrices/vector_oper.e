note
	description: "Summary description for {VECTOR_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR_OPER

	inherit
		SINGLE_MATH

feature

	cross_product (v1, v2: ARRAY [REAL]): ARRAY [REAL]
		require
			right_dim_1: v1.count = 3
			right_dim_2: v2.count = 3
		local
			res: ARRAY [REAL]
		do
			create res.make_filled (0, 0, v1.count - 1)
			res [0] := v1 [1] * v2 [2] - v2 [1] * v1 [2]
			res [1] := v2 [0] * v1 [2] - v1 [0] * v2 [2]
			res [2] := v1 [0] * v2 [1] - v2 [0] * v1 [1]
			Result := res
		end

	dot_product (v1, v2: ARRAY [REAL]): REAL
		require
			same_dim: v1.count = v2.count
		local
			res: REAL
			i: INTEGER
		do
			res := 0
			from
				i := 0
			until
				i >= v1.count
			loop
				res := res + v1 [i] * v2 [i]
			end
		end

	triangle_area (v1, v2: ARRAY [REAL]): REAL
		local
			tmp: ARRAY[REAL]
		do
			tmp := cross_product (v1, v2)
			Result := sqrt(tmp[0] * tmp[0] + tmp[1] * tmp[1] + tmp[2] * tmp[2]) / 2
		end

end
