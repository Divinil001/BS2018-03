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

	left : INTEGER

	right : INTEGER

	make(l, r : INTEGER)
		do
			left := l
			right := r
		end

	is_equal_range(other : like Current) : BOOLEAN
		require
			not_empty : not other.is_empty and not is_empty
		do
			result := false
			if other.left = current.left and other.right = current.right then
				result := true
			end
		end

	is_empty : BOOLEAN
		do
			result := false
			if right < left then
				result := true
			end
		end

	is_sub_range_of(other : like current) : BOOLEAN
		do
			result := false
			if other.left <= current.left and other.right >= current.right
			   or other.is_empty then
				result := true
			end
			if other.is_empty then
				result := false
			end
			if is_empty then
				result := true
			end
		end

	is_super_range_of(other : like current) : BOOLEAN
		do
			result := false
			if other.left >= current.left and other.right <= current.right then
				result := true
			end
			if other.is_empty then
				result := true
			end
		end

	left_overlaps(other : like current) : BOOLEAN
		require
			exist : not other.is_empty and not current.is_empty
		do
			result := false
			if other.right >= current.left and left >= other.left  then
				result := true
			end
		end

	right_overlaps(other : like current) : BOOLEAN
		require
			exist : not other.is_empty and not current.is_empty
		do
			result := false
			if current.right >= other.left then
				result := true
			end
		end

	overlaps(other : like current) : BOOLEAN
		require
			exist : not other.is_empty and not current.is_empty
		do
			result := false
			if left_overlaps(other) or right_overlaps(other) then
				result := true
			end
		end

	add(other : like current) : RANGE
		require
			possible : other.left <= right or other.right >= left or other.is_empty or is_empty
		local
			min, max : INTEGER
			temp : RANGE
		do
			if left < other.left then
				min := left
			else
				min := other.left
			end

			if right > other.right then
				max := right
			else
				max := other.right
			end

			if other.is_empty then
				min := left
				max := right
			end

			if is_empty then
				min := other.left
				max := other.right
			end
			create temp.make (min, max)
			result := temp
		end

	subtract(other: like Current): RANGE
	  require
	    valid_arguments: overlaps(other) or left - other.right = 1 or other.left - right = 1
	    empty_minus_not_empty: not (is_empty = true and other.is_empty = false)
      local
        new_range: RANGE
      do
        create new_range.make(0,0)
        if is_empty and other.is_empty then
          new_range.make(1,0)
        elseif other.is_empty then
          new_range.make(left, right)
        elseif left = other.left and right = other.right then
          new_range.make(1, 0)
        elseif left <= other.left then
          new_range.make(left, other.left - 1)
        elseif left >= other.left then
          new_range.make(other.right + 1, right)
        end

        result:=new_range

    end
end
