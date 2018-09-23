note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE

feature -- Access

	print_range
			-- `print_range'
		do
			print ("[" + left.out + ", " + right.out + "]")
		end

	right: INTEGER
			-- `right'

	left: INTEGER
			-- `left'

	subtract (other: like Current): ARRAYED_LIST [RANGE]
			-- `subtract'
		local r: RANGE
		do
			create r
			create Result.make (1)
			if Current.overlaps (other) then
				if Current.is_sub_range_of (other) or Current.is_equal_range (other) then
					r.set_left (0)
					r.set_right (-1)
					Result.extend (r)
				else
					if Current.is_super_range_of (other) then
						r.set_left (left)
						r.set_right (other.left)
						Result.extend (r)
						r.set_left (other.right)
						r.set_right (right)
						Result.extend (r)

					else
						if Current.left_overlaps (other) then
							r.set_left (other.right)
							r.set_right (right)
							Result.extend (r)
						elseif Current.right_overlaps (other) then
							r.set_left (left)
							r.set_right (other.left)
							Result.extend (r)
						end
					end
				end
			else
				r.set_left (left)
				r.set_right (right)
				Result.extend (r)
			end
		end

	add (other: like Current): ARRAYED_LIST [RANGE]
			-- `add'
		local r: RANGE
		do
			create Result.make (0)
			create r
			if Current.is_empty then
				r.set_left (other.left)
				r.set_right (other.right)
				Result.extend (r)
			elseif Current.is_super_range_of (other) or Current.is_equal_range (other) or other.is_empty then
				r.set_left (left)
				r.set_right (right)
				Result.extend (r)
			elseif Current.left_overlaps (other) or Current.right_overlaps (other) then
				if left <= other.left then
					r.set_left (left)
				else
					r.set_left (other.left)
				end
				if right >= other.right then
					r.set_right (right)
				else
					r.set_right (other.right)
				end
				Result.extend (r)
			else
				Result.extend (Current)
				Result.extend (other)
			end
		end

	overlaps (other: like Current): BOOLEAN
			-- `overlaps'
		require
			not_empty: True
		do
			if Current.right_overlaps (other) or Current.left_overlaps (other) then
				Result := True
			elseif Current.is_super_range_of (other) then
				Result := True
			else
				Result := False
			end
		ensure
			result_overlap_correct: Result = (Current.right_overlaps (other) or Current.left_overlaps (other) or Current.is_super_range_of (other))
		end

	right_overlaps (other: like Current): BOOLEAN
			-- `right_overlaps'
		require
			not_empty: (not Current.is_empty) and (not other.is_empty)
		do
			if right >= other.left and right <= other.right then
				Result := True
			else
				Result := False
			end
		ensure
			result_right_correct: Result = (right >= other.left and right <= other.right)
		end

	left_overlaps (other: like Current): BOOLEAN
			-- `left_overlaps'
		require
			not_empty: (not Current.is_empty) and (not other.is_empty)
		do
			if left >= other.left and left <= other.right then
				Result := True
			else
				Result := False
			end
		ensure
			result_left_correct: Result = (left >= other.left and left <= other.right)
		end

	is_super_range_of (other: RANGE): BOOLEAN
			-- `is_super_range_of'
		require
			current_not_empty: not Current.is_empty
		do
			if other.is_empty then
				Result := True
			else
				if other.left >= left and other.right <= right then
					Result := True
				else
					Result := False
				end
			end
		ensure
			result_super_correct: Result = (other.is_empty or (other.left >= left and other.right <= right))
		end

	is_sub_range_of (other: RANGE): BOOLEAN
			-- `is_sub_range_of'
		require
			other_not_empty: not other.is_empty
		do
			if Current.is_empty then
				Result := True
			else
				if (left >= other.left and right <= other.right) then
					Result := True
				else
					Result := False
				end

			end
		ensure
			result_sub_correct: Result = (Current.is_empty or (left >= other.left and right <= other.right))
		end

	is_empty: BOOLEAN
			-- `is_empty'
		do
			if left > right then
				Result := True
			else Result := False
			end
		ensure
			result_empty_correct: Result = (left > right)
		end

	is_equal_range (other: RANGE): BOOLEAN
			-- `is_equal_range'
		do
			Result := right = other.right and left = other.left
		ensure
			result_equal_correct: Result = (right = other.right and left = other.left)
		end

feature -- Element change

	set_right (a_right: like right)
			-- Assign `right' with `a_right'.
		do
			right := a_right
		ensure
			right_assigned: right = a_right
		end

	set_left (a_left: like left)
			-- Assign `left' with `a_left'.
		do
			left := a_left
		ensure
			left_assigned: left = a_left
		end

end
