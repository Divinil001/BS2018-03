note
	description: "hanoi application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make


feature
	solve
	do
		if n \\ 2 = 0 then
			solve_even
		else
			solve_odd
		end
	end

	pprint
	do
		io.read_character
		print("--------------------------")
		print("%N")
		print(towers[1].printt)
		print("%N")
		print(towers[2].printt)
		print("%N")
		print(towers[3].printt)
		print("%N")
		print("--------------------------")
		print("%N")
	end

	swap(towers1, towers2: TOWER)
	do
		if towers2.is_empty then
				towers2.add (towers1.top)
				towers1.pop
			elseif towers1.is_empty then
				towers1.add (towers2.top)
				towers2.pop
			elseif towers1.top > towers2.top then
				towers2.add (towers1.top)
				towers1.pop
			elseif towers1.top < towers2.top then
				towers1.add (towers2.top)
				towers2.pop
			end
	end

	solve_even
	do
		if towers[3].disks.count /= n then
			swap(towers[1], towers[2])
		end
		pprint

		if towers[3].disks.count /= n then
			swap(towers[1], towers[3])
		end
		pprint
		if towers[3].disks.count /= n then
			swap(towers[2], towers[3])
		end
		pprint
		if towers[3].disks.count /=n then
			solve_even
		end
	end

	solve_odd
	do
		if towers[3].disks.count /= n then
			swap(towers[1], towers[3])
		end
		pprint

		if towers[3].disks.count /= n then
			swap(towers[1], towers[2])
		end
		pprint
		if towers[3].disks.count /= n then
			swap(towers[2], towers[3])
		end
		pprint
		if towers[3].disks.count /=n then
			solve_odd
		end
	end
feature {NONE} -- Initialization
	n: INTEGER
	towers: ARRAY[TOWER]
	tower_one: TOWER
	tower_two: TOWER
	tower_three: TOWER
	i: INTEGER
	make
		do
			io.read_integer
			n := io.last_integer
			print("PRESS ENTER TO SEE THE MOVES")
			create towers.make_empty
			create tower_one.make_main(n)
			create tower_two.make_empty(n)
			create tower_three.make_empty(n)

			towers.force (tower_one, 1)
			towers.force (tower_two, 2)
			towers.force (tower_three, 3)
			solve
		end

end
