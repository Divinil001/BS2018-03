note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE
create
	fill_in
feature
	left: INTEGER
	right: INTEGER

feature {NONE}
	fill_in(a_left: INTEGER; a_right: INTEGER)
	require
		valid_range: a_left <= a_right
	do
		set_left(a_left)
		set_right(a_right)
	ensure
		valid_range: a_left <= a_right
	end

feature
	set_left(a_left: INTEGER)
	do
		left := a_left
	end

	set_right(a_right: INTEGER)
	do
		right := a_right
	end

	is_equal_range(other: like Current): BOOLEAN
	do
		Result := other.left.is_equal (current.left) and current.right.is_equal (other.right)
	end

	is_empty: BOOLEAN
	do
		Result := current.left > current.right
	end

	is_sub_range_of(other: like Current): BOOLEAN
	do
		if current.is_empty then
			Result := true
		elseif other.is_empty then
			Result := false
		else
			Result := current.left >= other.left and current.right <= other.right
		end
	end

	is_super_range_of(other: like Current): BOOLEAN
	do
		if other.is_empty then
			Result := true
		elseif current.is_empty then
			Result := false
		else
			Result := other.left >= current.left and other.right <= current.right
		end
	end

	min(a: INTEGER; b: INTEGER): INTEGER
	do
		if a < b then
			Result := a
		else
			Result := b
		end
	end

	max(a: INTEGER; b: INTEGER): INTEGER
	do
		if a > b then
			Result := a
		else
			Result := b
		end
	end

	overlaps(other: like Current): BOOLEAN
	do
		if current.is_empty or other.is_empty then
			Result := false
		else
			Result := not (other.right < current.left and other.left > current.right)
		end
	end

	range_intersection(other: like Current): RANGE
	require
		valid_overlap: overlaps(other)
	local
		overlap: RANGE
	do
		if current.is_empty then
			Result := current
		elseif other.is_empty then
			Result := current
		else
			create overlap.fill_in (max(current.left, other.left), min(current.right, other.right))
			Result := overlap
		end
	end

	pos_belong(p: INTEGER): BOOLEAN
	do
		Result := p >= current.left and p <= current.right
	end

	left_overlaps(other: like Current): BOOLEAN
	require
		valid_overlap: overlaps(other)
	local
		overlap: RANGE
	do
		overlap := current.range_intersection (other)
		Result := overlap.pos_belong(current.left)
	end

	right_overlaps(other: like Current): BOOLEAN
	require
		valid_overlap: overlaps(other)
	local
		overlap: RANGE
	do
		overlap := current.range_intersection (other)
		Result := overlap.pos_belong(current.right)
	end

	add(other: like Current): RANGE
	require
		valid_add: (not other.is_empty) and (not current.is_empty) and (not (current.left > other.right and current.right < other.left))
	local
		res: RANGE
	do
		create res.fill_in (min(other.left, current.left), max(other.right, current.right))
		Result := res
	end

	subtract(other: like Current): RANGE
	require
		valid_sub: (not other.is_empty) and (not current.is_empty) and other.is_sub_range_of (current) and (other.left.is_equal (current.left) or other.right.is_equal (current.right))
	local
		res: RANGE
	do
		if other.left.is_equal (current.left) then
			create res.fill_in (other.right, current.right)
		else
			create res.fill_in (current.left, other.left)
		end
		Result := res
	end
end
