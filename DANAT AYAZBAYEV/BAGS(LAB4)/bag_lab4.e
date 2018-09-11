note
	description: "BAG_LAB4 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	BAG_LAB4

inherit
	ARGUMENTS

create
	make

feature
	our_bag : ARRAYED_LIST[CELL_INFO]
	bag_size : INTEGER

feature
	elements : ARRAYED_LIST[CELL_INFO]
		do
			Result := our_bag
		end
	add (val : CHARACTER; n : INTEGER)
		local
			i : INTEGER
			found : BOOLEAN
			new_cell : CELL_INFO
		do
			found := FALSE
			from
				i := 1
			until
				i > bag_size or found = TRUE
			loop
				if our_bag[i].get_ch = val then
					our_bag[i].add_num(n)
					found := TRUE
				end
				i := i + 1
			end
			if found = FALSE then
				bag_size := bag_size + 1
				create new_cell.init(val, n)
				our_bag.extend(new_cell)
			end
		end
	remove (val : CHARACTER; n : INTEGER)
		local
			i : INTEGER
			found : BOOLEAN
			help : CELL_INFO
		do
			found := FALSE
			from
				i := 1
			until
				i > bag_size or found = TRUE
			loop
				if our_bag[i].get_ch = val then
					found := TRUE
					if our_bag[i].get_i <= n then
						help := our_bag[1]
						our_bag[1] := our_bag[i]
						our_bag[i] := help
						our_bag.remove_right
						bag_size := bag_size - 1
					else
						our_bag[i].add_num(0 - n)
					end
				end
				i := i + 1
			end
		end
	min : CHARACTER
		local
			mn : CHARACTER
			i : INTEGER
		do
			mn := '~'
			from
				i := 1
			until
				i > bag_size
			loop
				if our_bag[i].get_ch < mn then
					mn := our_bag[i].get_ch
				end
				i := i + 1
			end
			Result := mn
		end
	max : CHARACTER
		local
			mx : CHARACTER
			i : INTEGER
		do
			mx := ' '
			from
				i := 1
			until
				i > bag_size
			loop
				if our_bag[i].get_ch > mx then
					mx := our_bag[i].get_ch
				end
				i := i + 1
			end
			Result := mx
		end
	is_equal_bag (b : BAG_LAB4) : BOOLEAN
		local
			i : INTEGER
			j : INTEGER
			found : BOOLEAN
			equality : BOOLEAN
		do
			equality := TRUE
			from
				i := 1
			until
				i > bag_size or equality = FALSE
			loop
				found := FALSE
				from
					j := 1
				until
					j > b.get_size or found = TRUE
				loop
					if b.get_arr_ind(j) = our_bag[i] then
						found := TRUE
					end
					j := j + 1
				end
				if found = FALSE then
					equality := FALSE
				end
				i := i + 1
			end
			Result := equality
		end
	get_size : INTEGER
		do
			Result := bag_size
		end
	get_arr_ind (int : INTEGER) : CELL_INFO
		do
			Result := our_bag[int]
		end

feature {NONE}
	make
		do
			bag_size := 0
			create our_bag.make(0)
			add('a', 2)
			add('b', 3)
			add('c', 4)
			remove('d', 5)
			remove('b', 2)
			remove('a', 5)
			print(min)
			print("%N")
			print(max)
			print("%N")
			print(get_size)

		end
end
