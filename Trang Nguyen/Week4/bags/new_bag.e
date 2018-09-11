note
	description: "Summary description for {NEW_BAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEW_BAG

feature -- Access

	add (val: CHARACTER_8; n: INTEGER_32)
			-- Add n copies of val to bag
		local i: INTEGER
		do
			if in_bag (val) then
				elements.i_th (po).set_number_copies (elements.i_th (po).number_copies + n)
				else elements.force (create_cell (val, n))
			end
		end

	remove (val: CHARACTER_8; n: INTEGER_32)
			-- Remove as many copies of val as possible, up to n
		local i: INTEGER
		do
			if in_bag (val) then
				if elements.i_th (po).number_copies > n then
					elements.i_th (po).set_number_copies (elements.i_th (po).number_copies - n)
					else elements.prune (elements.i_th (po))
				end
			end
		end

	min: CHARACTER_8
			-- Return the minimum element from the bag
		local
			i: INTEGER
		do
			Result := '0'
			if elements.count > 0 then
				Result := elements.i_th (1).value
				from i := 1
				until i > elements.count
				loop
					if elements.i_th (i).value.code < Result.code then
						Result := elements.i_th (i).value
					end
					i := i + 1
				end
			end
		end


	max: CHARACTER_8
			-- Return the maximum element from the bag
		local
			i: INTEGER
		do
			Result := '0'
			if elements.count > 0 then
				from i := 1
				until i > elements.count
				loop
					if elements.i_th (i).value.code > Result.code then
						Result := elements.i_th (i).value
					end
					i := i + 1
				end
			end
		end

	is_equal_bag (b: NEW_BAG): BOOLEAN
			-- Return True if b is equal to the Current bag
		local
			i: INTEGER
			current_b: NEW_BAG
		do
			current_b := current
			Result := True
			if current_b.elements.count /= b.elements.count then
				Result := False
			else
				from i := 1
				until i > b.elements.count or Result = False
				loop
					if not current_b.in_bag (b.elements.i_th (i).value) then
						Result := False
					else
						if current_b.elements.i_th (po).number_copies /=  b.elements.i_th (i).number_copies then
							Result := False
						end
					end
					i := i + 1
				end
			end
		end

	in_bag (val: CHARACTER_8): BOOLEAN
			-- Check if val in bag
		local i: INTEGER
		do
			Result := False
			from i := 1
			until i > elements.count
			loop
				if elements.i_th (i).value.is_equal (val) then
					po := i
					i := elements.count
					Result := True
				end
				i := i + 1
			end
		end

	create_cell (val: CHARACTER_8; n: INTEGER_32): CELL_INFO
			-- Create a new cell
		do
			create Result
			Result.set_value (val)
			Result.set_number_copies (n)
		end

	make_elements
			-- Create elements
		do
			create elements.make (0)
		end

	print_bag
			-- Print elements of bag
		local i: INTEGER
		do
			io.put_string ("{")
			from i:= 1
			until i > elements.count
			loop
				io.put_string (" (")
				io.put_character (elements.i_th (i).value)
				io.put_string (", ")
				io.put_integer (elements.i_th (i).number_copies)
				io.put_string (")")
				i := i + 1
			end
			io.put_string (" }")
			io.new_line
		end

	po: INTEGER_32
			-- Posisiton of val in bag

	elements: ARRAYED_LIST [CELL_INFO]
			-- Containing the elements of the multiset
		attribute check False then end end --| Remove line when `elements' is initialized in creation procedure.

end
