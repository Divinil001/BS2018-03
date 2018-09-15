note
	description: "Summary description for {MATRIX_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_OPER


feature
	add(m1,m2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
	require
		m1.height = m2.height and m1.width = m2.width
	local
		res: ARRAY2[INTEGER]
		i: INTEGER
		j: INTEGER
		num: INTEGER
	do
		create res.make_filled (0, m1.height, m1.width)
		from
			i := 1
		until
			i = m1.height + 1
		loop
			from
				j := 1
			until
				j = m1.width + 1
			loop
				num := m1.item (i, j) + m2.item (i, j)
				res.force (num, i, j)
				j := j + 1
			end
			i := i + 1
		end
		Result := res
	end

	minus(m1,m2: ARRAY2[INTEGER]): ARRAY2[INTEGER]
	require
		m1.height = m2.height and m1.width = m2.width
	local
		res: ARRAY2[INTEGER]
		i: INTEGER
		j: INTEGER
		num: INTEGER
	do
		create res.make_filled (0, m1.height, m1.width)
		from
			i := 1
		until
			i = m1.height + 1
		loop
			from
				j := 1
			until
				j = m1.width + 1
			loop
				num := m1.item (i, j) - m2.item (i, j)
				res.force (num, i, j)
				j := j + 1
			end
			i := i + 1
		end
		Result := res
	end

	prod(m1, m2: ARRAY2[INTEGER]) : ARRAY2[INTEGER]
	require
		m1.width = m2.height
	local
		i: INTEGER
		j: INTEGER
		k: INTEGER
		res: ARRAY2[INTEGER]
		num: INTEGER
		row: ARRAY[INTEGER]
		column: ARRAY[INTEGER]
	do
		create res.make_filled (0, m1.height, m2.width)
		create row.make_empty
		create column.make_empty
		from
			i := 1
		until
			i = res.height + 1
		loop
			from
				j := 1
			until
				j = res.width + 1
			loop
				row := get_row(i, m1)
				column := get_column(j, m2)
				num := 0
				from
					k := 1
				until
					k = row.count + 1
				loop
					num := num + row[k] * column[k]
					k := k + 1
				end
				res.force (num, i, j)
				j := j + 1
			end
			i := i + 1
		end
		Result := res
	end


	get_row(k: INTEGER; m1: ARRAY2[INTEGER]): ARRAY[INTEGER]
	require
		k <= m1.height
	local
		j: INTEGER
		res: ARRAY[INTEGER]
	do
		create res.make_empty
		from
			j := 1
		until
			j = m1.width + 1
		loop
			res.force (m1.item (k, j), j)
			j := j + 1
		end
		Result:= res
	end

	get_column(k : INTEGER; m1: ARRAY2[INTEGER]): ARRAY[INTEGER]
	require
		k <= m1.width
	local
		i: INTEGER
		res: ARRAY[INTEGER]
	do
		create res.make_empty
		from
			i := 1
		until
			i = m1.height + 1
		loop
			res.force (m1.item (i, k), i)
			i := i + 1
		end
		Result:= res
	end

	det(m: ARRAY2[INTEGER]) : INTEGER
	require
		m.height = m.width
	local
		j: INTEGER
		res: INTEGER
	do
		if
			m.height = 2
		then
			Result := m.item (1, 1) * m.item (2, 2) - m.item (1, 2) * m.item (2, 1)
		else
			res := 0
			from
				j := 1
			until
				j = m.width + 1
			loop
				res := res + ((-1).power (1 + j)).rounded * det(get_matrix_for_det(m, 1, j))
				j := j + 1
			end
			Result := res
		end
	end

	det_for_cross_prod(m: ARRAY2[INTEGER]) : ARRAY[INTEGER]
	require
		m.height = m.width
	local
		j: INTEGER
		res: ARRAY[INTEGER]
		num: INTEGER
	do
		create res.make_empty
		from
			j := 1
		until
			j = m.width + 1
		loop
			num := ((-1).power (1 + j)).rounded * det(get_matrix_for_det(m, 1, j))
			res.force (num, j)
			j := j + 1
		end
		Result := res
	end

	get_matrix_for_det(m: ARRAY2[INTEGER]; i_pos, j_pos : INTEGER): ARRAY2[INTEGER]
	require
		m.height = m.width
	local
		i: INTEGER
		j: INTEGER
		k: INTEGER
		res : ARRAY2[INTEGER]
	do
		create res.make_filled (0, m.height - 1, m.width - 1)
		k := 1
		from
			i := 1
		until
			i = m.height + 1
		loop
			from
				j := 1
			until
				j = m.width + 1
			loop
				if (i /= i_pos and j /= j_pos)  then
					res.enter (m.item(i, j), k)
					k := k + 1
				end
				j := j + 1
			end
			i := i + 1
		end
		Result := res
	end
end
