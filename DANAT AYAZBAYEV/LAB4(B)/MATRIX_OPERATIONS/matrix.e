note
	description: "MATRIX_OPERATIONS application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX

inherit
	ARGUMENTS

create
	make

feature
	single_math: SINGLE_MATH
	    once
	        create Result
	    end
	add (m1, m2 : ARRAY2[INTEGER]) : ARRAY2[INTEGER]
		local
			i : INTEGER
			r : INTEGER
			c : INTEGER
			j : INTEGER
			res : ARRAY2[INTEGER]
		do
			r := m1.height
			c := m1.width
			create res.make_filled (0, r, c)
			from
				i := 1
			until
				i > r
			loop
				from
					j := 1
				until
					j > c
				loop
					res[i, j] := m1[i, j] + m2[i, j]
					j := j + 1
				end
				i := i + 1
			end
			Result := res
		end
	minus (m1, m2 : ARRAY2[INTEGER]) : ARRAY2[INTEGER]
		local
			i : INTEGER
			r : INTEGER
			c : INTEGER
			j : INTEGER
			res : ARRAY2[INTEGER]
		do
			r := m1.height
			c := m1.width
			create res.make_filled (0, r, c)
			from
				i := 1
			until
				i > r
			loop
				from
					j := 1
				until
					j > c
				loop
					res[i, j] := m1[i, j] - m2[i, j]
					j := j + 1
				end
				i := i + 1
			end
			Result := res
		end
	prod (m1, m2 : ARRAY2[INTEGER]) : ARRAY2[INTEGER]
		local
			i : INTEGER
			r1 : INTEGER
			r2 : INTEGER
			c1 : INTEGER
			c2 : INTEGER
			j : INTEGER
			k : INTEGER
			res : ARRAY2[INTEGER]
		do
			r1 := m1.height
			c1 := m1.width
			r2 := m2.height
			c2 := m2.width
			create res.make_filled(0, r1, c2)
			from
				i := 1
			until
				i > r1
			loop
				from
					j := 1
				until
					j > c2
				loop
					from
						k := 1
					until
						k > c1
					loop
						res[i, j] := res[i, j] + m1[i, k] * m2[k, j]
						k := k + 1
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := res
		end
	det (m : ARRAY2[INTEGER]) : INTEGER
		local
			i : INTEGER
			sz : INTEGER
			res : ARRAY2[INTEGER]
			j : INTEGER
			k : INTEGER
			cur : INTEGER
		do
			Result := 0
			sz := m.height
			if sz = 1 then
				Result := m[1, 1]
			elseif sz = 2 then
				Result := m[1, 1] * m[2, 2] - m[1, 2] * m[2, 1]
			else
				Result := 0
				create res.make_filled (0, sz - 1, sz - 1)
				from
					i := 1
				until
					i > sz
				loop
					from
						j := 2
					until
						j > sz
					loop
						cur := 0
						from
							k := 1
						until
							k > sz
						loop
							if k /= i then
								cur := cur + 1
								res[j - 1, cur] := m[j, k]
							end
							k := k + 1
						end
						j := j + 1
					end
					if i \\ 2 = 1 then
						Result := Result + m[1, i] * det(res)
					else
						Result := Result - m[1, i] * det(res)
					end
					i := i + 1
				end
			end
		end


feature
	mat : ARRAY2[INTEGER]
	mat2 : ARRAY2[INTEGER]
	mat3 : ARRAY2[INTEGER]
	mat4 : ARRAY2[INTEGER]
	ii : INTEGER
	jj : INTEGER

feature {NONE}
	make
		do
			create mat.make_filled (0, 4, 4)
			create mat2.make_filled (0, 2, 2)
			create mat3.make_filled (0, 2, 2)
			mat2[1, 1] := 2
			mat2[1, 2] := 1
			mat2[2, 1] := 5
			mat2[2, 2] := 7

			--check determinant of 2*2 matrix
			print(det(mat2).out + "%N%N")

			mat[1, 1] := 1
			mat[1, 2] := 3
			mat[1, 3] := 5
			mat[1, 4] := 9

			mat[2, 1] := 1
			mat[2, 2] := 3
			mat[2, 3] := 1
			mat[2, 4] := 7

			mat[3, 1] := 4
			mat[3, 2] := 3
			mat[3, 3] := 9
			mat[3, 4] := 7

			mat[4, 1] := 5
			mat[4, 2] := 2
			mat[4, 3] := 0
			mat[4, 4] := 9

			--check determinant of 4*4 matrix
			print(det(mat).out + "%N%N")

			mat3[1, 1] := -4
			mat3[1, 2] := 5
			mat3[2, 1] := -1
			mat3[2, 2] := 4

			--check product of 2*2 matrix
			mat4 := prod(mat2, mat3)
			from
				ii := 1
			until
				ii > 2
			loop
				from
					jj := 1
				until
					jj > 2
				loop
					print(mat4[ii, jj].out + " ")
					jj := jj + 1
				end
				print("%N")
				ii := ii + 1
			end

			--check addition of 2*2 matrix
			print("%N")
			mat4 := add(mat2, mat3)
			from
				ii := 1
			until
				ii > 2
			loop
				from
					jj := 1
				until
					jj > 2
				loop
					print(mat4[ii, jj].out + " ")
					jj := jj + 1
				end
				print("%N")
				ii := ii + 1
			end

			--check substraction of 2*2 matrix
			print("%N")
			mat4 := minus(mat2, mat3)
			from
				ii := 1
			until
				ii > 2
			loop
				from
					jj := 1
				until
					jj > 2
				loop
					print(mat4[ii, jj].out + " ")
					jj := jj + 1
				end
				print("%N")
				ii := ii + 1
			end

		end
end
