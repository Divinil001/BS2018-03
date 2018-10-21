note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE

create
	make

feature
	left: INTEGER
	right: INTEGER

feature
	make(n_left, n_right: INTEGER)
	do
		left := n_left
		right := n_right
	end

feature
	is_equal_range(other: RANGE): BOOLEAN
	local
		empty_all: BOOLEAN
	do
		empty_all := (other.is_empty and Current.is_empty)
		Result := (other.left = left) and (other.right = right) or empty_all
	end

	is_empty: BOOLEAN
	do
		Result := right < left
	end

	is_sub_range_of(other: RANGE): BOOLEAN
	do
		if  Current.is_empty then
			Result := True
		elseif other.is_empty then
			Result := False
		else
			Result := other.left <= Current.left and other.right >= Current.right
		end
	end

	is_super_range_of(other: RANGE): BOOLEAN
	do
		if other.is_empty then
			Result := True
		elseif Current.is_empty then
			Result := False
		else
			Result := other.left >= Current.left and other.right <= Current.right
		end
	end

	left_overlaps(other: RANGE): BOOLEAN
	do
		if  other.is_empty or Current.is_empty then
			Result := False
		else
			Result := (other.right >= Current.left and other.left <= Current.left)  or Current.is_sub_range_of (other)
		end
	end

	right_overlaps(other: RANGE): BOOLEAN
	do
		if  other.is_empty or Current.is_empty then
			Result := False
		else
			Result := (other.left <= Current.right and other.right >= Current.right) or Current.is_sub_range_of (other)
		end
	end

	overlaps(other: RANGE): BOOLEAN
	do
		if  other.is_empty or Current.is_empty then
			Result := False
		else
			Result := left_overlaps(other) or right_overlaps(other) or Current.is_super_range_of (other)
		end
	end

	max(a,b: INTEGER) : INTEGER
	do
		if a >= b then
			Result := a
		else
			Result := b
		end
	end

	min(a,b: INTEGER) : INTEGER
	do
		if a <= b then
			Result := a
		else
			Result := b
		end
	end

	add(other: RANGE) : RANGE
	require
		overlaps:
			(not other.is_empty) and (not Current.is_empty) and Current.overlaps (other)
	local
		new_range: RANGE
		new_l: INTEGER
		new_r: INTEGER
	do
		new_l := min(other.left, Current.left)
		new_r := max(other.right, Current.right)
		create new_range.make (new_l, new_r)
		Result := new_range
	end

	substract(other: RANGE): RANGE
	require
		(not other.is_empty) and (not Current.is_empty) and Current.overlaps (other)
	local
		new_range: RANGE
		new_l: INTEGER
		new_r: INTEGER
	do
		new_l := 0
		new_r := 0
		create new_range.make (new_l, new_r)
		Result := new_range
	end
end
