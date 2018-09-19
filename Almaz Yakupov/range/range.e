note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE

create
	summon

feature
	left: INTEGER
	right: INTEGER

	summon(i_l: INTEGER; i_r: INTEGER)
		require
			it_is_right: i_l <= i_r
		do
			left := i_l
			right := i_r
		end

	is_equal_range(other: like Current): BOOLEAN
		do
			Result := other.left = left and other.right = right
		end

	is_empty: BOOLEAN
		do
			Result := left = right
		end

	is_sub_range_of(other: like Current): BOOLEAN
		do
			Result := other.left <= left and right <= other.right
		end

	is_super_range_of(other: like Current): BOOLEAN
		do
			Result := left < other.left and other.right < right
		end

	left_overlaps(other: like Current): BOOLEAN
		do
			Result := other.left <= left and left <= other.right
		end

	right_overlaps(other: like Current): BOOLEAN
		do
			Result := other.left <= right and right <= other.right
		end

	overlaps(other: like Current): BOOLEAN
		do
			Result := other.right >= left or other.left <= right
		end

	add(other: like Current): RANGE
		require
			it_is_right: other.right => left or other.left <= right
		local
			o_l: INTEGER
			o_r: INTEGER
			output: RANGE
		do
			if other.left < left then
				o_l := other.left
			else
				o_l := left
			end

			if other.right > right then
				o_r := other.right
			else
				o_r := right
			end

			create output.summon(left, right)

			Result := output
		end

end
