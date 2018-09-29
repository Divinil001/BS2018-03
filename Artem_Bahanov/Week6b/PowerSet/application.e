note
	description: "PowerSet application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	t1, t2: ARRAY[INTEGER]
	make
	local

			-- Run application.
		do
			--| Add your code here
			t1 := <<1, 2, 3>>
			io.put_string ("t1 subsets %N")
			print_power_set(power_set(t1))

			t2 := <<1, 2, 3, 4>>
			io.put_string ("t2 subsets %N")
			print_power_set(power_set(t2))
		end

	power_set(a: ARRAY[INTEGER]): ARRAY[ARRAY[INTEGER]]
		local
			b: ARRAY[INTEGER]
			c, d: ARRAY[ARRAY[INTEGER]]
			i: INTEGER
		do
			create b.make_empty
			create c.make_empty
			create d.make_empty
			if a.count = 1 then
				create Result.make_empty
				create b.make_empty
				Result.force (a, 1)
				Result.force (b, 2)
			else
				c := power_set(a.subarray (1, a.count - 1))
				d := copy_power_set(c)
				from
					i := 1
				until
					i > d.count
				loop
					d.at (i).force (a.at (a.count), d.at (i).count + 1)
					i := i + 1
				end
				Result := unite(c, d)
			end
		end

	unite(c, d: ARRAY[ARRAY[INTEGER]]): ARRAY[ARRAY[INTEGER]]
		local
			i, s: INTEGER
		do
			create Result.make_empty
			Result.copy(c)
			s := c.count
			from
				i := s + 1
			until
				i > s + d.count
			loop
				Result.force(d.at (i - s), i)
				i := i + 1
			end
		end

	copy_power_set(a: ARRAY[ARRAY[INTEGER]]): ARRAY[ARRAY[INTEGER]]
	local
		i, height, j: INTEGER
		t, v: ARRAY[INTEGER]

	do
		height := a.count
		create t.make_empty
	 	create result.make_filled (t, 1, a.count)
	 	from i := 1 until i > height loop
	 		create v.make_filled (0, 1, a[i].count)
	 		result[i] := v;
	 		i := i + 1
	 	end
	 	from i := 1 until i > height loop
	 		from j := 1 until j > a[i].count loop
	 			result[i].force(a[i].at (j), j)
	 			j := j + 1
	 		end
	 		i := i + 1
	 	end
	end

	print_power_set(a: ARRAY[ARRAY[INTEGER]])
		local
			i, j: INTEGER
		do
			from
				i := 1
			until
				i > a.count
			loop
				io.put_string ("[ ")
				from
					j := 1
				until
					j > a.at (i).count
				loop
					io.put_string (a.at (i).at (j).out + " ")
					j := j + 1
				end
				io.put_string ("]%N")
				i := i + 1
			end
		end
end
