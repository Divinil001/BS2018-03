note
	description: "Summary description for {VECTOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR
feature
	cross_product (v1, v2: ARRAY [INTEGER]): ARRAY [INTEGER]
		require
			size_is_not_allowed: v2.count = 3 and v1.count = 3
		local
			qwerty: ARRAY[INTEGER]
		do
			create qwerty.make_filled (0, 1, 3)
			qwerty[1]:=v1[2]*v2[3]-v1[3]*v2[2]
			qwerty[2]:=v1[3]*v2[1]-v1[1]*v2[3]
			qwerty[3]:=v1[1]*v2[2]-v1[2]*v2[1]
			Result:= qwerty
		end


	doc_product (v1, v2: ARRAY [INTEGER]): INTEGER
		require
			size_is_not_allowed: v2.count = 3 and v1.count = 3
		do
			Result:=v1[1]*v2[1]+v1[2]*v2[2]+v1[3]*v2[3]
		end


	triangle_area (v1, v2: ARRAY [INTEGER]): DOUBLE
		require
			size_is_not_allowed: v2.count = 3 and v1.count = 3
		do
			Result := (cross_product(v1,v2)[1]^2+cross_product(v1,v2)[2]^2+cross_product(v1,v2)[3]^2)/2
		end
end
