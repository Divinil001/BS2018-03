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

	make(a_left: INTEGER a_right: INTEGER)
	do
		left := a_left
		right := a_right

		if right < left then
			right := left
		end
	end

	is_equal_range(other: like Current): BOOLEAN
	require
		non_void: other /= Void
	do
		Result := (s_empty and other.s_empty) or (left = other.left and right = other.right)
	end

	s_empty(): BOOLEAN
	do
		Result := left = right
	end

	is_sub_range_of(other: like Current): BOOLEAN
	require
		non_void: other /= Void
	do
		Result := left >= other.left and right <= other.right
	end

	is_super_range_of(other: like Current): BOOLEAN
	require
		non_void: other /= Void
	do
		Result := left <= other.left and right >= other.right
	end

	left_overlaps(other: like Current): BOOLEAN
	require
		non_void: other /= Void
	do
		Result := left <= other.right and left >= other.left
	end

	right_overlaps(other: like Current): BOOLEAN
	require
		non_void: other /= Void
	do
		Result := right >= other.left and right <= other.right
	ensure
	end

	overlaps(other: like Current): BOOLEAN
	require
		non_void: other /= Void
	do
		Result := right_overlaps(other) or left_overlaps(other)
	end

	add(other: like Current)
	require
		non_void: other /= Void
		overlaps: overlaps(other)
	do
		if other.right >= right then
			right := other.right
		end

		if other.left <= left then
			left := other.left
		end
	end

	subtract(other: like Current)
	require
		non_void: other /= Void
		overlaps: overlaps(other)
		not_super_range: not is_super_range_of (other)
	do
		if other.right <= right then
			right := other.right
		end

		if other.left >= left then
			left := other.left
		end
	ensure
	end

	m_print()
	do
		print("Range: [")
		io.put_integer(left)
		print(", ")
		io.put_integer(right)
		print("]%N")
	end
end
