note
	description: "Summary description for {MATRIX}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX
create
	fill_in
feature
	n: INTEGER
	m: INTEGER
	field: ARRAY2 [INTEGER]
feature {NONE}
	fill_in(a_n: INTEGER; a_m: INTEGER)
	do
		n := a_n
		m := a_m
		create field.make(a_n, a_m)
	end
feature {NONE}
	add(m1: MATRIX; m2: MATRIX): MATRIX
	require
		add_exists: m1.n = m2.n and m1.m = m2.m
	local
		m3: MATRIX
		i: INTEGER
		j: INTEGER
	do
		create m3.fill_in(m1.n, m1.m)
		from
			i := 1
		until
			i > m1.n
		loop
			from
				j := 1
			until
				j > m1.m
			loop
				m3.field.item (i, j) := m1.field.item(i, j) + m2.field.item(i, j)
			end
		end
		Result := m3
	end

	minus(m1: MATRIX; m2: MATRIX): MATRIX
	require
		add_exists: m1.n = m2.n and m1.m = m2.m
	local
		m3: MATRIX
		i: INTEGER
		j: INTEGER
	do
		create m3.fill_in(m1.n, m1.m)
		from
			i := 1
		until
			i > m1.n
		loop
			from
				j := 1
			until
				j > m1.m
			loop
				m3.field.item (i, j) := m1.field.item(i, j) - m2.field.item(i, j)
			end
		end
		Result := m3
	end

	prod(m1: MATRIX; m2: MATRIX): MATRIX
	require
		add_exists: m1.m = m2.n
	local
		m3: MATRIX
		i: INTEGER
		j: INTEGER
		g: INTEGER
	do
		create m3.fill_in(m1.n, m2.m)
		from
			i := 1
		until
			i > m1.n
		loop
			from
				j := 1
			until
				j > m2.m
			loop
				from
					g := 1
				until
					g > m1.m
				loop
					m3.field.item (i, j) := m3.field.item (i, j) + m1.field.item (i, g) * m2.field.item (g, i)
				end
			end
		end
		Result := m3
	end

	minor(x: INTEGER; y: INTEGER; m1: MATRIX): MATRIX
	require
		position_exists: x >= 1 and x <= m1.n and y >= 1 and y <= m1.m
	local
		i: INTEGER
		j: INTEGER
		a_i: INTEGER
		a_j: INTEGER
		m2: MATRIX
	do
		create m2.fill_in (m1.n - 1, m1.n - 1)
		from
			i := 1
			a_i := 1
		until
			i > m1.n
		loop
			if i /= x then
				from
					j := 1
					a_j := 1
				until
					j > m1.n
				loop
					if j /= y then
						m2.field.item (a_i, a_j) := m1.field.item (i, j)
						j := j + 1
						a_j := a_j + 1
					else
						j := j + 1
					end
				end
				i := i + 1
				a_i := a_i + 1
			else
				i := i + 1
			end
		end
		Result := m2
	end

	det(m1: MATRIX): INTEGER
	require
		valid_matrix: m1.n = m1.m
	local
		m2: MATRIX
		j: INTEGER
		ans: INTEGER
	do
		from
			j := 1
		until
			j > m1.m
		loop
			if j \\ 2 = 1 then
				ans := ans + det(minor(1, j, m1))
			else
				ans := ans + det(minor(1, j, m1))
			end
			j := j + 1
		end
	end
end
