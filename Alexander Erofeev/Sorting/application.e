note
	description: "sort application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	a:ARRAY[INTEGER]
	t:INTEGER
	make
			-- Run application.
		do
			--| Add your code here
create a.make_filled (0, 1,5)
		a[1]:=2
		a[2]:=3
		a[3]:=1
		a[4]:=5
		a[5]:=4
		mergesort(1,5)
		print(a[1])
		print(a[2])
		print(a[3])
		print(a[4])
		print(a[5])
		create s.make_filled (0, 1,5)
		end
		s:ARRAY[INTEGER]


		mergesort (left, right: INTEGER)

		local

			mid: INTEGER

		do

			if left + 1 < right then

				mid := (left + right) // 2

				mergesort (left, mid)

				mergesort (mid, right)

				merge (left, mid, right)

			end

		end



	merge (left, mid, right: INTEGER)

		local

			it_r, it_l, i: INTEGER

			res: ARRAY [INTEGER]

		do

			it_l := 0

			it_r := 0

			create res.make_filled (0, 0, right - left)

			from

			until

				not (left + it_l < mid and then mid + it_r < right)

			loop

				if a [left + it_l] < a [mid + it_r] then

					res [it_l + it_r] := a [left + it_l]

					it_l := it_l + 1

				else

					res [it_l + it_r] := a [mid + it_r]

					it_r := it_r + 1

				end

			end

			from

			until

				not (left + it_l < mid)

			loop

				res [it_l + it_r] := a [left + it_l]

				it_l := it_l + 1

			end

			from

			until

				not (mid + it_r < right)

			loop

				res [it_l + it_r] := a [mid + it_r]

				it_r := it_r + 1

			end

			from

				i := 0

			until

				i >= it_l + it_r

			loop

				a [left + i] := res [i]

				i := i + 1

			end

		end
end
