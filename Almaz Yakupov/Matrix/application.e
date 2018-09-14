note
	description: "matrix application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	m1, m2: ARRAY2 [INTEGER]
	l, i, q: INTEGER
	matrix_operator: MATRIX_OPER

	make
		do
			create matrix_operator.summon
			create m1.make_filled (0, 3, 3)
			create m2.make_filled (0, 3, 3)
			q := 0

			from
				l := 1
			until
				l = 4
			loop
				from
					i := 1
				until
					i = 4
				loop
					q := q + 1
					m1.put (q, l, i)
					i := i + 1
				end
				l := l + 1
			end

			from
				l := 1
			until
				l = 4
			loop
				from
					i := 1
				until
					i = 4
				loop
					m2.put (q, l, i)
					q := q - 1
					i := i + 1
				end
				l := l + 1
			end

			print(matrix_operator.prod(m1, m2))
			print("%N Lol")
		end

end
