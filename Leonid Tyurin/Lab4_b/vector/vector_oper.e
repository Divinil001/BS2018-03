note
	description: "Summary description for {VECTOR_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR_OPER

inherit
	DOUBLE_MATH

feature

	cross_product(v1, v2 : ARRAY[INTEGER]):ARRAY[INTEGER]
		require
			size : v1.upper = 3 and v2.upper = 3
		local
			temp : ARRAY[INTEGER]
		do
			create temp.make_empty

			temp.force (v1[2] * v2[3] - v1[3] * v2[2], 1)
			temp.force (v1[1] * v2[3] - v1[3] * v2[1], 2)
			temp.force (v1[1] * v2[2] - v1[2] * v2[1], 3)

			result := temp
		end

	dot_product(v1, v2 : ARRAY[INTEGER]):INTEGER
		require
			size : v1.upper = v2.upper
		local
			i, ans : INTEGER
		do
			ans := 0
			from
				i := 1
			until
				i = v1.upper + 1
			loop
				ans := ans + v1[i] * v2[i]
				i := i + 1
			end
			result := ans
		end

	triangle_area(v1, v2 : ARRAY[INTEGER]):REAL_64
		require
			size : v1.upper = v2.upper
		local
			i : INTEGER
			len_v1, len_v2 , cos, sin : REAL_64
		do
			len_v1 := 0
			len_v2 := 0
			from
				i := 1
			until
				i = v1.upper + 1
			loop
				len_v1 := len_v1 + v1[i] * v1[i]
				len_v2 := len_v2 + v2[i] * v2[i]
				i := i + 1
			end
			len_v1 := sqrt(len_v1)
			len_v2 := sqrt(len_v2)

			cos := dot_product(v1, v2) / (len_v1 * len_v2)

			sin := sqrt(1 - cos * cos)
			result := len_v1 * len_v2 * sin / 2
		end

end
