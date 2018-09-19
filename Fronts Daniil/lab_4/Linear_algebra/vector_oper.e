note
	description: "Summary description for {VECTOR_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR_OPER

feature
	cross_product(v1, v2: ARRAY[INTEGER]) : ARRAY[INTEGER]
	require
		v1.count = v2.count and v2.count = 3
	local
		tmp_matrix: ARRAY2[INTEGER]
		res: ARRAY[INTEGER]
		i: INTEGER
		m_o: MATRIX_OPER
	do
		create res.make_empty
		create tmp_matrix.make_filled (1, 3, 3)
		create m_o
		from
			i := 4
		until
			i = 7
		loop
			tmp_matrix.enter (v1[i - 3], i)
			i := i + 1
		end
		from
			i := 7
		until
			i = 10
		loop
			tmp_matrix.enter (v2[i - 6], i)
			i := i + 1
		end
		res := m_o.det_for_cross_prod (tmp_matrix)
		Result := res
	end

	dot_product(v1, v2: ARRAY[INTEGER]) : INTEGER
	require
		v1.count = v2.count
	local
		i: INTEGER
		res: INTEGER
	do
		res := 0
		from
			i := 1
		until
			i = v1.upper + 1
		loop
			res := res + v1[i] * v2[i]
			i := i + 1
		end
		Result := res
	end

	len(v: ARRAY[INTEGER]) : REAL_64
	local
		i: INTEGER
		num: REAL
	do
		from
			i := 1
		until
			i = v.upper + 1
		loop
			num := num + v[i].power (2).rounded
			i := i + 1
		end
		Result := num.power (0.5)
	end

	triangle_area(v1, v2: ARRAY[INTEGER]): REAL_64
	require
		v1.count = v2.count and v1.count < 4 and v1.count > 1
	local
		tx_v1: ARRAY[INTEGER]
		tx_v2: ARRAY[INTEGER]
		res: REAL_64
		i: INTEGER
		cross_prod: ARRAY[INTEGER]
	do
		create tx_v1.make_filled (0, 1, 3)
		create tx_v2.make_filled (0, 1, 3)
		create cross_prod.make_empty
		if v1.count = 2 then
			from
				i := 1
			until
				i = 3
			loop
				tx_v1[i] := v1[i]
				tx_v2[i] := v2[i]
				i := i + 1
			end
		else
			tx_v1 := v1
			tx_v2 := v2
		end
		cross_prod := cross_product(tx_v1, tx_v2)
		res := len(cross_prod) / 2

		if res > 0 then
			Result := res
		else
			Result := - res
		end
	end
end
