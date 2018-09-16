note
	description: "Summary description for {VECTOR_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR_OPER

feature
	cross_product(v1,v2:ARRAY[INTEGER]):ARRAY[INTEGER]
	require
		correct_v1:v1.count > 0
		correct_v2:v2.count > 0
	local
		res : ARRAY[INTEGER]
	do
		create res.make_empty

		res.force (v1[2]*v2[3]-v1[3]*v2[2], res.count + 1)
		res.force (v1[3]*v2[1]-v1[1]*v2[3], res.count + 1)
		res.force (v1[1]*v2[2]-v1[2]*v2[1], res.count + 1)
		Result := res
	end

	dot_product(v1,v2:ARRAY[INTEGER]):INTEGER
	require
		correct_v1:v1.count > 0
		correct_v2:v2.count > 0
		equal_count:v1.count = v2.count
	local
		res : INTEGER
	do
		res := v1[1]*v2[1] + v1[2]*v2[2] + v1[3]*v2[3]

		Result := res
	end

	triangle_area(v1,v2:ARRAY[INTEGER]):DOUBLE
	require
		correct_v1:v1.count > 0
		correct_v2:v2.count > 0
		equal_count:v1.count = v2.count
	local
		res : DOUBLE
		mo :MATRIX_OPER
		vec1, vec2 :ARRAY[INTEGER]
	do
		create mo
		create vec1.make_empty
		create vec2.make_empty

		vec1.force (v1[1], vec1.count + 1)
		vec1.force (v1[2], vec1.count + 1)
		vec1.force (0, vec1.count + 1)
		vec2.force (v2[1], vec2.count + 1)
		vec2.force (v2[2], vec2.count + 1)
		vec2.force (0, vec2.count + 1)

		res := 0.5 * vector_length(cross_product (vec1,vec2))

		Result := res
	end

	vector_length(v:ARRAY[INTEGER]):DOUBLE
	require
		correct_v:v.count > 0
	local
		res : DOUBLE
		i:INTEGER
	do
		from
			i := 1
		until
			i = v.count + 1
		loop
			res := res + v[i].power (2)
			i := i + 1
		end
		res := res.power (0.5)

		Result := res
	end
end
