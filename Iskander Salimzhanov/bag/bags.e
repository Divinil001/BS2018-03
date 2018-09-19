note
	description: "Summary description for {BAGS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAGS
create
	fill_in
feature {NONE}
	fill_in(a_size: INTEGER)
	do
		set_size(a_size)
		set_elements(a_size)
	end
feature
	size: INTEGER
	elements: ARRAYED_LIST [CELL_INFO]
feature
	set_size(a_size: INTEGER)
	do
		size := a_size
	end

	set_elements(a_size: INTEGER)
	do
		create elements.make(a_size)
	end
feature
	add(val: CHARACTER; n: INTEGER)
	local
		flag: BOOLEAN
		a_cell: CELL_INFO
	do
		flag := false
		across elements as element loop
			if element.item.value = val then
				flag := true
				element.item.set_number_copies (element.item.number_copies + n)
			end
		end
		if flag then
			create a_cell.fill_in(val, n)
			elements.extend(a_cell)
		end
	end

	del(val: CHARACTER; n: INTEGER)
	require
		val_exists: exists(val) and cell(val).number_copies >= n
	local
		flag: BOOLEAN
	do
		flag := false
		across elements as element loop
			if element.item.value = val then
				flag := true
				element.item.set_number_copies (element.item.number_copies - n)
			end
		end
	end

	exists(val: CHARACTER): BOOLEAN
	do
		Result := false
		across elements as element loop
			if element.item.number_copies /= 0 and element.item.value = val then
				Result := true
			end
		end
	end

	cell(val: CHARACTER): CELL_INFO
	require
		val_exists: exists(val)
	local
		a_cell: CELL_INFO
	do
		across elements as element loop
			if element.item.value = val then
				Result := element.item
			end
		end
		create a_cell.fill_in (' ', 0)
		Result := a_cell
	end

	remove(val: CHARACTER; n: INTEGER)
	require
		val_exists: exists(val)
	local
		a_cell: CELL_INFO
	do
		a_cell := cell(val)
		if a_cell.number_copies < n then
			del(a_cell.value, a_cell.number_copies)
		else
			del(a_cell.value, n)
		end
	end

	min: CHARACTER
	do
		Result := ' '
		across elements as element loop
			if element.item.number_copies /= 0 and element.item.value < Result then
				Result := element.item.value
			end
		end
	end

	max: CHARACTER
	do
		Result := ' '
		across elements as element loop
			if element.item.number_copies /= 0 and element.item.value > Result then
				Result := element.item.value
			end
		end
	end
end
