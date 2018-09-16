note
	description: "Summary description for {MATRIX_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_OPER

create default_create

feature
	add(m1,m2: ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require equal_matrix: m1.height = m2.height and m2.width = m1.width
	local i,j :INTEGER
		m3:ARRAY2[INTEGER]

	do
			create m3.make_filled (0, m1.height, m2.width)
			from
			i:=0
			until
			i>m1.height
			loop
				from
					j:=0
				until
					j>m1.width
				loop
					m3.item (i, j) := m1.item (i, j) + m2.item (i, j)

					j:=j+1
				end
				i:=i+1
			end
			Result:= m3
		end

	minus(m1,m2: ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require equal_matrix: m1.height = m2.height and m2.width = m1.width
	local i,j :INTEGER
		m3:ARRAY2[INTEGER]

	do
			create m3.make_filled (0, m1.height, m2.width)
			from
			i:=0
			until
			i>m1.height
			loop
				from
					j:=0
				until
					j>m1.width
				loop
					m3.item (i, j) := m1.item (i, j) - m2.item (i, j)

					j:=j+1
				end
				i:=i+1
			end
			Result:= m3
end

	prod(m1,m2: ARRAY2[INTEGER]):ARRAY2[INTEGER]
	require row_is_equal_to_column: m1.width = m2.height
	local i,j,k:INTEGER
	m3:ARRAY2[INTEGER]
	do
		create m3.make_filled (0, m1.width, m2.height)
		from
			i:=0
		until
			i> m1.height
		loop
			from
				j:=0
			until
				j>m2.width
			loop
				from
					k:=0
				until
					k>m1.width
				loop
					m3.item (i, j):= m3.item (i, j) + m1.item (i, k) * m2.item (k, j)
					k:=k+1
				end -- end k
				j:=j+1


			end -- end j
			i:=i+1
		end --end i
		Result:= m3
	end-- end prod

	det(m: ARRAY2[INTEGER]; n:INTEGER):INTEGER --n is degree of matrix
	require exist_m: n > 0
	local i,j,d,k:INTEGER
	temp_mat:ARRAY2[INTEGER]
	do
		d:=0; k:=1
		if
			n=1
		then
			Result := m.item(1,1)

		elseif
			n=2
		then
			Result:=m.item(1,1)*m.item(2,2)-m.item(2,1)*m.item(1,2)

		end--if
		end--end det


end -- end CLass
