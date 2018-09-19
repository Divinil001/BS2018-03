note
	description: "Summary description for {MATRIX}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
class
	MATRIX
feature
	add(m1, m2:ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require
		sizes_not_equal: m1.height = m2.height and m1.width = m2.width
	local
		qwerty:ARRAY2[INTEGER]
		i, j:INTEGER
	do
		create qwerty.make_filled (0, m1.height, m1.width)
		from
			i:= 1
		until
			i > qwerty.height
		loop
			from
				j:= 1
			until
				j > qwerty.width
			loop
				qwerty[i,j] := m1[i,j] + m2[i,j]
				j := j + 1
			end
			i := i + 1
		end
		Result := qwerty
	end


	minus(m1, m2:ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require
		sizes_not_equal: m1.height = m2.height and m1.width = m2.width
	local
		qwerty:ARRAY2[INTEGER]
		i , j:INTEGER
	do
		create qwerty.make_filled (0, m1.height, m1.width)
		from
			i:= 1
		until
			i > qwerty.height
		loop
			from
				j:= 1
			until
				j > qwerty.width
			loop
				qwerty[i,j] := m1[i,j] - m2[i,j]
				j := j + 1
			end
			i := i + 1
		end
		Result := qwerty
	end


	prod(m1, m2:ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require
		sizes_not_equal: m1.width = m2.height
	local
		i, j, k, sum:INTEGER
		qwerty:ARRAY2[INTEGER]
	do
		create qwerty.make_filled (0, m1.height, m2.width)
		from
			i := 1
		until
			i > qwerty.height
		loop
			from
				j := 1
			until
				j > qwerty.width
			loop
				sum := 0
				from
					k := 1
				until
					k > m1.width
				loop
					sum  := sum + m1[i,k]*m2[k,j]
					k := k + 1
				end
				qwerty[i,j] := sum
				j := j + 1
			end
			i := i + 1
		end
		Result := qwerty
	end


	det2(m:ARRAY2[INTEGER]):INTEGER
	do
		Result := m[1,1]*m[2,2] - m[1,2]*m[2,1]
	end


	det(m:ARRAY2[INTEGER]):INTEGER
	require
		sizes_not_equal: m.width = m.height
		sizes_is_not_allowed: m.width <= 3
	local
		a1, a2, a3:ARRAY2[INTEGER]
	do
		create a1.make_filled (0, m.height, m.width)
		create a2.make_filled (0, m.height, m.width)
		create a3.make_filled (0, m.height, m.width)
		if
			m.width = 1
		then
			Result := m.item(1 , 1)
		elseif
			m.width = 2
		then
			Result := det2(m)
		else
			a1[1,1] := m[2,2]
			a1[1,2] := m[2,3]
			a1[2,1] := m[3,2]
			a1[2,2] := m[3,3]
			a2[1,1] := m[2,1]
			a2[1,2] := m[2,3]
			a2[2,1] := m[3,1]
			a2[2,2] := m[3,3]
			a3[1,1] := m[2,1]
			a3[1,2] := m[2,2]
			a3[2,1] := m[3,1]
			a3[2,2] := m[3,2]
			Result := m[1,1]*det2(a1) - m[1,2]*det2(a2) + m[1,3]*det2(a3)
		end
	end

end
