note
	description: "Summary description for {MULTISET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MULTISET

create
	create_multiset

feature
	elements:ARRAY[CELL_INFO]


feature
	create_multiset
	do
		create elements.make_empty
	end

	add(val:CHARACTER; n:INTEGER)
	require
		positive_copies_number : n > 0
	local
		c : CELL_INFO
		added : BOOLEAN
		i : INTEGER
	do
		added := FALSE
		from
			i := 0
		until
			i = Current.elements.count
		loop
			i := i + 1
			if Current.elements.at (i).value.is_equal (val) then
				Current.elements.at (i).set_number (Current.elements.at (i).number_copies + n)
				added := TRUE
			end
		end
		if not added then
			create c.create_cell (val, n)
			elements.force (c, elements.count + 1)
		end

	end

	remove(val:CHARACTER; n:INTEGER)
	require
		positive_removing_number : n > 0
	local
		i : INTEGER
		count_removed : INTEGER
	do
		count_removed := 0

		from
			i := 0
		until
			i = elements.count
		loop
			i := i + 1

			if elements.at(i).value.is_equal (val) then
				if elements.at (i).number_copies < n then
					elements.at (i).set_number (0)
				else
					elements.at (i).set_number (elements.at (i).number_copies - n)
				end
			end
		end
	end

	min:CHARACTER
	require
		positive_amount_in_array : elements.count > 0
	local
		minim : CHARACTER
		i : INTEGER
	do
		minim := elements.at (1).value

		from
			i := 1
		until
			i = elements.count + 1
		loop
			if elements.at (i).value < minim then
				minim := elements.at (i).value
			end
		end

		Result := minim
	end

	max:CHARACTER
	require
		positive_amount_in_array : elements.count > 0
	local
		maxim : CHARACTER
		i : INTEGER
	do
		maxim := elements.at (1).value

		from
			i := 1
		until
			i = elements.count + 1
		loop
			if elements.at (i).value > maxim then
				maxim := elements.at (i).value
			end
		end

		Result := maxim
	end

	is_equal_bag(b:MULTISET):BOOLEAN
	local
		count_of_equal : INTEGER
		i, j : INTEGER
	do
		count_of_equal := 0

		if Current.elements.count = b.elements.count then
			from
				i:= 0
			until
				i = Current.elements.count
			loop
				i := i + 1

				from
					j := 0
				until
					j = b.elements.count
				loop
					j := j + 1

					if Current.elements.at (i).number_copies = b.elements.at (j).number_copies
						and Current.elements.at (i).value.is_equal (b.elements.at (j).value) then
						count_of_equal := count_of_equal + 1
					end
				end
			end

			if count_of_equal = Current.elements.count then
				Result := TRUE
			else
				Result := FALSE
			end
		else
			Result := FALSE
		end

	end

	print_multiset()
	local
		i : INTEGER
	do
		from
			i := 0
		until
			i = Current.elements.count
		loop
			i := i + 1
			print(Current.elements.at (i).value.out + ":" + Current.elements.at (i).number_copies.out + " ")
		end
		print("%N")
	end

end
