class
	RANGES_OF_NUMBERS
create
	make
feature
	left, right : INTEGER

	make (l, r : INTEGER)
	do
		left := l
		right := r
	end

	is_equal_range(other: RANGES_OF_NUMBERS): BOOLEAN
	do
		Result := other.left = left and other.right = right

	end

	is_empty: BOOLEAN
	do
		Result := left > right

	end

	is_sub_range_of(other: RANGES_OF_NUMBERS):BOOLEAN
	do
		Result := left >= other.left  and other.right >= right
	end

	is_super_range_of(other: RANGES_OF_NUMBERS): BOOLEAN
	do
		Result := other.left >= left and other.right <= right
	end

	left_overlaps(other:RANGES_OF_NUMBERS): BOOLEAN
	do
		Result := other.left <= left and left <= other.right and right >= other.right
	end

	right_overlaps(other:RANGES_OF_NUMBERS): BOOLEAN
	do
		Result := other.left >= left and other.left <= right and right <= other.right
	end

	overlaps(other: RANGES_OF_NUMBERS): BOOLEAN
	do
		Result := right_overlaps(other) or left_overlaps(other)
	end

	add(other: RANGES_OF_NUMBERS):RANGES_OF_NUMBERS
	require
		cond_of_add: (not (right + 1 < other.left or other.right + 1 < left) or (is_empty or other.is_empty))
	local
		range: RANGES_OF_NUMBERS
	do
		create range.make (left.min (other.left), right.max (other.right))
		Result := range
	end

	subtract(other: RANGES_OF_NUMBERS):RANGES_OF_NUMBERS
	require
		cond_of_subtract: ((left = other.left and right >= other.right) or (left < other.left and right <= other.right) and not is_empty)
	local
		range: RANGES_OF_NUMBERS
	do
		if other.is_empty then
			create range.make (left, right)
			Result := range
		elseif left = other.left and right >= other.right then
			create range.make (other.right + 1, right)
			Result := range
		else
			create range.make (left, other.left - 1)
			Result := range
		end
	end
end
