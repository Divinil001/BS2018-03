note
	description: "l4vectors application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make


feature {NONE} -- Initialization



	make

		local

			v1, v2, cp: ARRAY [INTEGER]

		do

			create v1.make_filled (0, 1, 3)

			v1 [1] := 3

			v1 [2] := -2

			v1 [3] := 1

			create v2.make_filled (0, 1, 3)

			v2 [1] := 2

			v2 [2] := -5

			v2 [3] := -3

			print (dot_product (v1, v2).out + "%N") -- 13



			cp := cross_product (v1, v2)

			across

				cp as c

			loop

				print (c.item.out + " ") -- 11 11 -11

			end

		end



	dot_product (v1, v2: ARRAY [INTEGER]): INTEGER

		require

			equal_dimension: v1.count = v2.count

		local

			i: INTEGER

		do

			from

				i := 1

			until

				i > v1.count

			loop

				Result := Result + v1 [i] * v2 [i]

				i := i + 1

			end

		end



	cross_product (v1, v2: ARRAY [INTEGER]): ARRAY [INTEGER]

		require

			equal_dimension: v1.count = v2.count

		local

			mat: ARRAY2 [INTEGER]

			ans: ARRAY [INTEGER]

			i, j, k: INTEGER

		do

			create mat.make_filled (0, 2, 3)

			create ans.make_filled (0, 1, 3)

			from

				i := 1

			until

				i > v1.count

			loop

				mat [1, i] := v1 [i]

				mat [2, i] := v2 [i]

				i := i + 1

			end



			ans[1] := mat[1,2]*mat[2,3] - mat[2,2]*mat[1,3]

			ans[3] := mat[1,1]*mat[2,3] - mat[2,1]*mat[1,3]

			ans[2] := mat[1,2]*mat[2,3] - mat[2,2]*mat[1,3]

			Result := ans

		end



	triangle_area(v1,v2:ARRAY[INTEGER]):DOUBLE

	require
		equal_dimension: v1.count = v2.count

	local

		cp:ARRAY[INTEGER]

	do

		cp:=cross_product (v1, v2)

		Result := (cp[1] ^ 2 + cp[2] ^ 2 + cp[3] ^ 2) ^ 0.5 / 2

	end

end

