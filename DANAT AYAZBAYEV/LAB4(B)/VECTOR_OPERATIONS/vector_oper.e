note
	description: "VECTOR_OPER application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR_OPER

inherit
	ARGUMENTS

create
	make

feature
	single_math: SINGLE_MATH
	    once
	        create Result
	    end
	cross_product(v1, v2 : ARRAY[INTEGER]) : ARRAY[INTEGER]
		require
			vector_size : v1.capacity = 3 and v2.capacity = 3
		local
			res : ARRAY[INTEGER]
		do
			create res.make_filled (0, 1, 3)
			res[1] := v1[2] * v2[3] - v1[3] * v2[2]
			res[2] := v1[3] * v2[1] - v1[1] * v2[3]
			res[3] := v1[1] * v2[2] - v1[2] * v2[1]
			Result := res
		end
	dot_product(v1, v2 : ARRAY[INTEGER]) : INTEGER
		require
			size_equality : v1.capacity = v2.capacity
		local
			i : INTEGER
		do
			Result := 0
			from
				i := 1
			until
				i > v1.capacity
			loop
				Result := Result + v1[i] * v2[i]
				i := i + 1
			end
		end
	triangle_area(v1, v2: ARRAY[INTEGER]) : REAL_64
		require
			vector_size : v1.capacity = v2.capacity and v1.capacity = 2 or v1.capacity = 3
		local
			mat : ARRAY2[INTEGER]
			x : INTEGER
			y : INTEGER
			z : INTEGER
		do
			create mat.make_filled (0, v1.capacity, v2.capacity)
			if v1.capacity = 2 then
				Result := single_math.rabs(v1[1] * v2[2] - v1[2] * v2[1]) / 2
			else
				x := v1[2] * v2[3] - v1[3] * v2[2]
				y := v1[3] * v2[1] - v1[1] * v2[3]
				z := v1[1] * v2[2] - v1[2] * v2[1]
				Result := single_math.sqrt(x * x + y * y + z * z) / 2
			end
		end

feature
	vec : ARRAY[INTEGER]
	vec2 : ARRAY[INTEGER]
	vec3 : ARRAY[INTEGER]
	vec4 : ARRAY[INTEGER]
	vec5 : ARRAY[INTEGER]

feature {NONE}
	make
		do
			create vec.make_filled(0, 1, 3)
			create vec2.make_filled(0, 1, 3)
			vec[1] := 3
			vec[2] := 5
			vec[3] := 2

			vec2[1] := 6
			vec2[2] := -2
			vec2[3] := 4
			--checking triangle_area of 3D vectors
			print(triangle_area(vec, vec2).out + "%N%N")

			create vec3.make_filled(0, 1, 2)
			create vec4.make_filled(0, 1, 2)

			vec3[1] := 0
			vec3[2] := 1

			vec4[1] := 1
			vec4[2] := 0
			--checking triangle_area of 2D vectors
			print(triangle_area(vec3, vec4).out + "%N%N")

			vec5 := cross_product(vec, vec2)
			--checking cross_product
			print(vec5[1].out + " " + vec5[2].out + " " + vec5[3].out + "%N%N")

			--checking dot_product
			print(dot_product(vec, vec2))
		end
end
