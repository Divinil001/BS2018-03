note
	description: "Summary description for {BAG1}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAG1

	create make

	feature
		elements: ARRAY[CELL_INFO]
		

		make
			do
				create elements.make_empty

			end --end make

		add(val: CHARACTER;n: INTEGER)


			require
				n_is_positive: n > 0
			local i:INTEGER_32
			cell: CELL_INFO
			do

				create cell.make(val, n)
				from
					i:=0
				until
					i>n
				loop
					elements.force (cell, i)
				end
			ensure
				elements_are_not_empty: elements.count >0

			end --end add

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
				end -- if 1 end
			end -- if 2 end
		end -- end loop
		ensure
			elements_is_not_more_than_old: elements.count < old elements.count
	end-- remove ends

	 min: CHARACTER
	 require
		positive_amount_in_array : elements.count > 0
	 local i:INTEGER
	       minimum:CHARACTER
	 do
	 	minimum := elements.at(0).value
	 	from
	 		i:=0
	 	until
	 		i> elements.count + 1
	 	loop
	 		if
	 			elements.at(i).value < min
	 		then
	 			minimum:=elements.at(i).value
	 		end --end if
	 	end --end loop
	 	Result:= min
	 	ensure minimum_is_not_empty: not elements.is_empty

	 end --end min

	 	max:CHARACTER
	require
		positive_amount_in_array : elements.count > 0
	local
		maximum : CHARACTER
		i : INTEGER
	do
		maximum := elements.at (1).value

		from
			i := 1
		until
			i = elements.count + 1
		loop
			if elements.at (i).value > maximum then
				maximum := elements.at (i).value
			end
		end

		Result := maximum
	end--end max
	is_equal_bag(b: BAG1):BOOLEAN
	local count, i, j:INTEGER
	do
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
						count := count + 1
					end
				end
			end

			if count = Current.elements.count then
				Result := TRUE
			else
				Result := FALSE
			end
		else
			Result := FALSE
		end

	end


end -- end class BAG
