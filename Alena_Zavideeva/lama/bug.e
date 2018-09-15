class
	BUG

create
	make

feature
	elements: ARRAY[CELL_INFO]
	make

	local
	tmp : CHARACTER
		do
			create elements.make_empty
		end

feature

	add (val: CHARACTER; n: INTEGER)
		local
			i : INTEGER
			break : BOOLEAN
			g: CELL_INFO
		do
			break := FALSE
			from
				i := 1
				break := FALSE
			until
				i > elements.count or break
			loop
				if
					val = elements[i].value
				then
					elements[i].add_chr (n)
					break := TRUE
				end
				i := i + 1
			end

			if break = FALSE then
				create g.make (val)
				g.add_chr (n-1)
				elements.force (g, elements.count + 1)
			end
		ensure
			added: has_in_arr(val)
		end


	remove(val: CHARACTER; n: INTEGER)
		require
			not_in_array: has_in_arr(val)
		local
			i: INTEGER
			break : BOOLEAN
		do
			break := FALSE
			from
				i := 1
			until
				i > elements.count or break
			loop
				if
					elements[i].value = val
				then
					elements[i].remove_chr (n)
					if elements[i].number_copies = 0 then
						delete_from_arr(elements[i].value)
					end
				end
				i:= i + 1
			end
		end
	has_in_arr (val: CHARACTER): BOOLEAN
	local
		i :INTEGER
		break : BOOLEAN
	do
		break := FALSE
		from
			i := 1
		until
			i > elements.count or break
		loop
			if
				elements[i].value = val
			then
				break := TRUE
			end
			i:= i + 1
		end

		Result := break
	end

	has_in_arr1 (val: CHARACTER): INTEGER
	local
		i :INTEGER
		break : BOOLEAN
	do
		break := FALSE
		from
			i := 1
		until
			i > elements.count or break
		loop
			if
				elements[i].value = val
			then
				break := TRUE
			end
			i:= i + 1
		end
		if break = FALSE then
			Result := -1
		else
			Result := i - 1
		end
	end

	delete_from_arr (val: CHARACTER)
		require
			not_in_array: has_in_arr(val)

		local
			i :INTEGER
			element: ARRAY[CELL_INFO]
		do
			create element.make_empty
			from
				i := 1
			until
				i > elements.count
			loop
				if
					elements[i].value /= val
				then
					element.force (elements[i], element.count + 1)
				end
				i := i + 1
			end

			elements := element

		ensure
			not_in_array: not has_in_arr (val)
		end

	min_chr: CHARACTER
		require
			elements.count > 0
		local
			tmp : CHARACTER
			i : INTEGER
		do
			from
				i := 1
			until
				i > elements.count
			loop
				if tmp.code > elements[i].value.code then
					tmp := elements[i].value
				end
				i := i + 1
			end
			Result:= tmp
		end

	max_chr: CHARACTER
		require
			elements.count > 0
		local
			tmp : CHARACTER
			i : INTEGER
		do
			from
				i := 1
			until
				i > elements.count
			loop
				if tmp.code < elements[i].value.code then
					tmp := elements[i].value
				end
				i := i + 1
			end
			Result:= tmp
		end

	is_equal_bug(bags : BUG): BOOLEAN

	local
		i, j : INTEGER
		break : BOOLEAN
	do
		if (bags.elements.count = elements.count)
		then
			break := FALSE
			from
				i := 1
			until
				i > elements.count or break
			loop
				if
					bags.has_in_arr1 (elements[i].value) /= -1
				then
					if
						bags.elements[bags.has_in_arr1 (elements[i].value)].number_copies /= elements[i].number_copies
					then
						break := TRUE
					end
				end

				i := i + 1
			end

			if break = FALSE then
				Result := True
			end
		else
			Result := False
		end
	end

end
