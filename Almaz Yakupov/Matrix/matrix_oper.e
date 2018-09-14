note
	description: "Summary description for {MATRIX_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_OPER

create
	summon

feature
	summon
		do

		end

	add(m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
		require
			width_equal: m1.width = m2.width
			height_equal: m1.height = m2.height
		local
			l, i: INTEGER
			cash: ARRAY2 [INTEGER]
		do
			create cash.make_filled (0, m1.width, m2.height)
			from
				l := 1
			until
				l = m1.width + 1
			loop
				from
					i := 1
				until
					i = m2.height + 1
				loop
					cash.put (m1.item (l, i) + m2.item (l, i), l, i)
					i := i + 1
				end
				l := l + 1
			end
			Result := cash
		end

	minus(m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
		require
			width_equal: m1.width = m2.width
			height_equal: m1.height = m2.height
		local
			l, i: INTEGER
			cash: ARRAY2 [INTEGER]
		do
			create cash.make_filled (0, m1.width, m2.height)
			from
				l := 1
			until
				l = m1.width + 1
			loop
				from
					i := 1
				until
					i = m2.height + 1
				loop
					cash.put (m1.item (l, i) - m2.item (l, i), l, i)
					i := i + 1
				end
				l := l + 1
			end
			Result := cash
		end

	prod(m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]
		require
			main_require: m1.width = m2.height
		local
			g, q, l: INTEGER
			cash: ARRAY2 [INTEGER]
			sub_cash: INTEGER
		do
			create cash.make_filled (0, m2.height, m1.width)
			sub_cash := 0
			from
				g := 1
			until
				g = m1.width + 1
			loop
				from
					q := 1
				until
					q = m2.height + 1
				loop
					from
						l := 1
					until
						l = m1.width + 1
					loop
						sub_cash := sub_cash + m1.item (q, l) * m2.item (l, g)
						l := l + 1
					end
					cash.put (sub_cash, g, q)
					sub_cash := 0
					q := q + 1
				end
				g := g + 1
			end
			Result := cash
		end

end
