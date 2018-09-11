note
	description: "Summary description for {M_BAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	M_BAG

create
	make

feature

	elements: ARRAY [CELL_INFO]

	make
		local
			empty: CELL_INFO
			i: INTEGER
		do
			create empty.make ('0', 0)
			create elements.make_filled (empty, 0, 128)
			from
				i := 0
			until
				i >= 128
			loop
				create empty.make (i.to_character_8, 0)
				elements [i] := empty
				i := i + 1
			end
		end

	add (val: CHARACTER; n: INTEGER)
		do
			elements [val.code].set_count (elements [val.code].number_of_copies + n)
		end

	remove (val: CHARACTER; n: INTEGER)
		require
			elements [val.code].number_of_copies - n >= 0
		do
			elements [val.code].set_count (elements [val.code].number_of_copies - n)
		end

	min: CHARACTER
		local
			min_index: INTEGER
			i: INTEGER
		do
			min_index := -1
			from
				i := 0
			until
				i >= 128
			loop
				if min_index /= -1 and elements [i].number_of_copies /= 0 then
					min_index := i
				end
				i := i + 1
			end
		end

	max: CHARACTER
		local
			max_index: INTEGER
			i: INTEGER
		do
			max_index := -1
			from
				i := 127
			until
				i < 0
			loop
				if max_index /= -1 and elements [i].number_of_copies /= 0 then
					max_index := i
				end
				i := i - 1
			end
		end

	is_equal_bag (b: M_BAG): BOOLEAN
		local
			good: BOOLEAN
			i: INTEGER
		do
			good := True
			from
				i := 0
			until
				i >= 128
			loop
				if elements [i].number_of_copies /= b.elements [i].number_of_copies then
					good := False
				end
				i := i + 1
			end
			Result := good
		end

end
