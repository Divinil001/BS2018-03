class
	RANGE
	create
		make

	feature
		left, right: INTEGER

	feature
		make(left_n, right_n: INTEGER)
		do
			left := left_n
			right := right_n
		end

	feature
		is_equal_range(other: like Current): BOOLEAN
		do
			Result := left ~ other.left and right ~ other.right
		end

		is_empty: BOOLEAN
		do
			Result := Current.right - Current.left < 0
		end

		both_not_empty(other: like Current): BOOLEAN
		do
			Result := not Current.is_empty and not other.is_empty
		end

		is_sub_range_of(other: like Current): BOOLEAN
		do
			Result := Current.left >= other.left and Current.right <= other.right or is_empty
		end

		is_super_range_of(other: like Current): BOOLEAN
		do
			Result := other.left >= Current.left and other.right <= Current.right or other.is_empty
		end

		left_overlaps(other: like Current): BOOLEAN
		do
			Result := both_not_empty(other) and Current.left <= other.right and Current.left >= other.left
		end

		right_overlaps(other: like Current): BOOLEAN
		do
			Result := both_not_empty(other) and Current.right >= other.left and Current.right <= other.right
		end

		overlaps(other: like Current): BOOLEAN
		do
			Result := right_overlaps(other) or left_overlaps(other) or is_super_range_of(other)
		end

		add(other: like Current): RANGE
		require
			is_overlap: overlaps(other) or is_empty or other.is_empty
		local
			new_left, new_right: INTEGER
		do
			if other.is_empty then
				new_left := Current.left
				new_right := Current.right
			elseif Current.is_empty then
				new_left := other.left
				new_right := other.right
			else
				new_left := min(other.left, Current.left)
				new_right := max(other.right, Current.right)
			end
			create Result.make(new_left, new_right)
		end

		subtract(other: like Current): RANGE
		require
			not_sub: Current.left = other.left or current.right = other.right or not is_super_range_of(other)
		local
			new_left, new_right: INTEGER
		do
			if is_sub_range_of(other) then
				new_left := 1
				new_right := 0
			elseif right_overlaps(other) then
				new_left := Current.left
				new_right := other.left
			elseif left_overlaps(other) then
				new_left := other.right
				new_right := Current.right
			else
				new_left := Current.left
				new_right := Current.right
			end
			create Result.make (new_left, new_right)
		end

		max(a, b: INTEGER): INTEGER
		do
			Result := b
			if a > b then
				Result := a
			end
		end

		min(a, b: INTEGER): INTEGER
		do
			Result := a
			if a > b then
				Result := b
			end
		end

		print1(name: STRING)
		do
			Io.put_string ("Range " + name + " [" + left.out + ".." +right.out + "]%N")
		end
end
