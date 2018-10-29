note
	description: "Matrix application root class"
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

			m1, m2, m3: ARRAY2 [INTEGER]

			-- Run application.

		do

			create m1.make_filled (0, 1, 3)

			create m2.make_filled (0, 3, 1)

			m1 [1, 1] := 1

			m1 [1, 2] := 2

			m1 [1, 3] := 3

			m2 [1, 1] := 4

			m2 [2, 1] := 5

			m2 [3, 1] := 6

			m3 := prod (m1, m2)

			create m3.make_filled (0, 3, 3)

			m3 [1, 1] := 12

			m3 [1, 2] := 36

			m3 [1, 3] := 9

			m3 [2, 1] := -5

			m3 [2, 2] := 8

			m3 [2, 3] := 2

			m3 [3, 1] := 9

			m3 [3, 2] := 5

			m3 [3, 3] := 0

			print (det (m3)) -- -345

		end



feature

		add (m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]

		require

			eq_height: m1.height = m2.height

			eq_width: m1.width = m2.width

		local

			ans: ARRAY2 [INTEGER]

			i, j: INTEGER

		do

			create ans.make_filled (0, m1.height, m1.width)

			from

				i := 1

			until

				i > m1.height

			loop

				from

					j := 1

				until

					j > m1.width

				loop

					ans [i, j] := m1 [i, j] + m2 [i, j]

					j := j + 1

				end

				i := i + 1

			end

			Result := ans

		end



	minus (m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]

		require

			eq_height: m1.height = m2.height

			eq_width: m1.width = m2.width

		local

			ans: ARRAY2 [INTEGER]

			i, j: INTEGER

		do

			create ans.make_filled (0, m1.height, m1.width)

			from

				i := 1

			until

				i > m1.height

			loop

				from

					j := 1

				until

					j > m1.width

				loop

					ans [i, j] := m1 [i, j] - m2 [i, j]

					j := j + 1

				end

				i := i + 1

			end

			Result := ans

		end



	prod (m1, m2: ARRAY2 [INTEGER]): ARRAY2 [INTEGER]

		require

			prod: m1.width = m2.height

		local

			ans: ARRAY2 [INTEGER]

			i, j, m, sum: INTEGER

		do

			create ans.make_filled (0, m1.height, m2.width)

			from

				i := 1

			until

				i > m1.height

			loop

				from

					j := 1

				until

					j > m2.width

				loop

					sum := 0

					from

						m := 1

					until

						m > m2.height

					loop

						sum := sum + m1 [i, m] * m2 [m, j]

						m := m + 1

					end

					ans [i, j] := sum

					j := j + 1

				end

				i := i + 1

			end

			Result := ans

		end



	det (m: ARRAY2 [INTEGER]): INTEGER

		require

			square_matrix: m.width = m.height

		local

			i, j, k, x, c: INTEGER

			tmp: ARRAY2 [INTEGER]

		do

			if m.width = 1 then

				Result := m [1, 1]

			else

				if m.width = 2 then

					Result := m [1, 1] * m [2, 2] - m [1, 2] * m [2, 1]

				else

					create tmp.make_filled (0, m.width - 1, m.height - 1)

					c := 1

					from

						j := 1

					until

						j > m.width

					loop

						from

							i := 2

						until

							i > m.width

						loop

							x := 0

							from

								k := 1

							until

								k > m.width

							loop

								if k /= j then

									x := x + 1

									tmp [i - 1, x] := m [i, k]

								end

								k := k + 1

							end

							i := i + 1

						end

						Result := Result + c * m [1, j] * det (tmp)

						c := - c

						j := j + 1

					end

				end

			end

		end



end
