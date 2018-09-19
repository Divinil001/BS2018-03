note
	description: "Summary description for {MULTISET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MULTISET

create
	make

feature
	elements: ARRAYED_LIST[CELL_INFO]

feature

	make
		local
			new_element: CELL_INFO
			i: INTEGER
		do
			create elements.make(0)
			from i := 0
			until i >= 128
			loop
				create new_element.make (i.to_character_8)
				elements.extend (new_element)
				i := i + 1
			end
		end

	add (pos: CHARACTER; new_number: INTEGER)
	do
		elements.at(pos.code + 1).add_number_copies (new_number)
	end

	remove (pos: CHARACTER; new_number: INTEGER)
	do
		if new_number > elements.at(pos.code + 1).number_copies then
			elements.at(pos.code + 1).add_number_copies (0-elements.at(pos.code + 1).number_copies)
		else
			elements.at(pos.code + 1).add_number_copies (0-new_number)
		end
	end

	max: CHARACTER
	local
		i: INTEGER
		flag: BOOLEAN
	do
		flag := true

		from i := 128
		until (i < 1 or flag = false)
		loop
			if elements.at(i).number_copies > 0 then
				Result := elements.at(i).value
				flag := false
			end
			i := i - 1
		end
	end

	min: CHARACTER
	local
		i: INTEGER
		flag: BOOLEAN
	do
		flag := true

		from i := 1
		until (i > 128 or flag = false)
		loop
			if elements.at(i).number_copies > 0 then
				Result := elements.at(i).value
				flag := false
			end
			i := i + 1
		end
	end

	is_equal_multiset (multi2: MULTISET): BOOLEAN
	local
		i: INTEGER
	do
		Result := true

		from i := 1
		until (i > 128 or Result = false)
		loop
			if elements.at(i).number_copies /~ multi2.elements.at(i).number_copies then
				Result := false
			end
			i := i + 1
		end
	end

	print_multiset: STRING
	local
		i: INTEGER
	do
		Result := "["
		across elements as it
		loop
			from i := 1
			until i > it.item.number_copies
			loop
				Result.append (it.item.value.out + ", ")
				i := i + 1
			end
		end
		Result.remove_tail (2)
		Result.append ("]%N")
	end

end
