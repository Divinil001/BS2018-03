note
	description: "Summary description for {VECTOR_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR_OPER

inherit
	DOUBLE_MATH

feature -- Access

	triangle_area (v1: ARRAY [INTEGER]; v2: ARRAY [INTEGER]): REAL_64
			-- Returns area of that triangle
		local
			cross: ARRAY [INTEGER]
			i: INTEGER
		do
			Result := 0
			create cross.make_from_array (cross_product (v1, v2))
			from i := 1
			until i > 3
			loop
				Result := Result + cross.item (i).to_double * cross.item (i).to_double
				i := i + 1
			end
			Result := sqrt (Result) / 2

		end

	dot_product (v1: ARRAY [INTEGER]; v2: ARRAY [INTEGER]): INTEGER
			-- Returns the scalar product of v1 and v2
		do
			Result := v1.item (1) * v2.item (1) + v1.item (2) * v2.item (2) + v1.item (3) * v2.item (3)
		end

	cross_product (v1: ARRAY [INTEGER]; v2: ARRAY [INTEGER]): ARRAY [INTEGER]
			-- Returns the cross product of vectors v1 and v2
		do
			create Result.make_filled (0, 1, 3)
			Result.put (v1.item (2) * v2.item (3) - v1.item (3) * v2.item (2), 1)
			Result.put (v1.item (3) * v2.item (1) - v1.item (1) * v2.item (3), 2)
			Result.put (v1.item (1) * v2.item (2) - v1.item (2) * v2.item (1), 3)
		end

end
