class
	MY_BAG

create
	init

feature
	elements: LINKED_LIST[CELL_INFO]

feature

	init
		do
			create elements.make
		end

	draw
		require
			have_something: elements.count > 0

		local
			i: INTEGER

		do
			from
				i := 1
			until
				i > elements.count
			loop
				Io.put_character (elements[i].value)
				Io.put_string (":")
				Io.put_integer (elements[i].number_copies)
				if
					i /= elements.count
				then
					Io.put_string ("; ")
				end
				i := i + 1
			end
			Io.put_string ("%N")
		end

	add(val: CHARACTER; num: INTEGER)
		require
			positive_amount: num > 0

		local
			cell: CELL_INFO
			i: INTEGER
			flag: BOOLEAN

		do
			flag := false
			from
				i := 1
			until
				i > elements.count or flag
			loop
				if
					elements[i].value = val
				then
					flag := true
					elements[i].increase (num)
				end

				i := i + 1
			end

			if
				not flag
			then
				create cell.init (val, num)
				elements.extend (cell)
			end
		end

	remove(val: CHARACTER; num: INTEGER): MY_BAG
		require
			positive_amount: num > 0

		local
			new_bag: MY_BAG
			i: INTEGER
			flag: BOOLEAN
		do
			create new_bag.init
			flag := false

			from
				i := 1
			until
				i > elements.count or flag
			loop
				if
					elements[i].value = val
				then
					flag := true
					elements[i].decrease (num)
				end

				i := i + 1
			end
			Result := CURRENT.remove_empty
		end

	min: CHARACTER
		require
			has_elements: elements.count > 0

		local
			i: INTEGER
			min_: CHARACTER

		do
			min_ := elements[1].value

			from
				i := 1
			until
				i > elements.count
			loop
				if
					elements[i].value < min_
				then
					min_ := elements[i].value
				end

				i := i + 1
			end
			Result := min_
		end

	max: CHARACTER
		require
			has_elements: elements.count > 0

		local
			i: INTEGER
			max_: CHARACTER

		do
			max_ := elements[1].value

			from
				i := 1
			until
				i > elements.count
			loop
				if
					elements[i].value > max_
				then
					max_ := elements[i].value
				end

				i := i + 1
			end
			Result := max_
		end

	is_equal_bag(bag_: MY_BAG): BOOLEAN
		require
			both_have_elements: CURRENT.elements.count > 0 and bag_.elements.count > 0

		local
			i, j: INTEGER
			found, flag: BOOLEAN

		do
			flag := false
			found := false

			if
				elements.count /= bag_.elements.count
			then
				flag := true
			end

			from
				i := 1
			until
				i > elements.count or flag
			loop
				from
					j := 1
				until
					j > bag_.elements.count
				loop
					if
						elements[i].value = bag_.elements[j].value and elements[i].number_copies = bag_.elements[j].number_copies and not found
					then
						flag := false
						found := true
					else
						if
							found
						then
							flag := false
						else
							flag := true
						end
					end

					j := j + 1
				end

				found := false
				i := i + 1
			end

			Result := not flag
		end

	remove_empty: MY_BAG
		local
			new_bag: MY_BAG
			new_cell: CELL_INFO
			i: INTEGER
		do
			create new_bag.init

			from
				i := 1
			until
				i > elements.count
			loop
				if
					elements[i].number_copies > 0
				then
					create new_cell.init(elements[i].value, elements[i].number_copies)
					new_bag.elements.extend(new_cell)
				end

				i := i + 1
			end
			Result := new_bag
		end
end
