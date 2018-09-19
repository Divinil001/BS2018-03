note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE

create
	create_range

feature
	--variables
	left:INTEGER --lower boundary of the range
	right:INTEGER	--upper boundary of the rage

feature

	create_range(x_left: INTEGER; x_right:INTEGER)
		do
			left:=x_left
			right:=x_right
		end

	is_equal_range(other: like Current):BOOLEAN
		require
			not Current.is_empty or not other.is_empty
		do
			if Current.left = other.left and Current.right = other.right then
				Result:=True
			else
				Result:=False
			end
		end

	is_empty: BOOLEAN
		do
			if Current.left > Current.right  then
				Result:=True
			else
				Result:=False
			end
		end

	is_sub_range_of(other: like Current):BOOLEAN
		require
			not Current.is_empty or not other.is_empty
		do
			if Current.left - other.left >= 0 and Current.right - other.right <= 0 then
				Result:= true
			else
				Result:=false
			end
		end

	is_super_range_of(other: like Current):BOOLEAN
		require
			not Current.is_empty or not other.is_empty
		do
			if Current.left - other.left <= 0 and Current.right - other.left >= 0 then
				Result:=true
			else
				Result:=false
			end
		end

	left_overlaps(other: like Current):BOOLEAN
		require
			not Current.is_empty or not other.is_empty
		do
			if Current.left >= other.left then
				Result:=true
			else
				Result:=false
			end
		end

	right_overlaps(other: like Current):BOOLEAN
		require
			not Current.is_empty or not other.is_empty
		do
			if Current.right <= other.right then
				Result:=true
			else
				Result:=false
			end
		end

	set_right(a_right: INTEGER)
		do
			right:=a_right
		end

	set_left(a_left: INTEGER)
		do
			left := a_left
		end

	overlaps(other: like Current): BOOLEAN
		require
			not Current.is_empty or not other.is_empty
		do
			if Current.left_overlaps (other) and Current.right_overlaps (other) then
				Result:=true
			else
				Result:=false
			end
		end

	add(other: like Current): RANGE
		require
			Current.overlaps (other)
		do
			Current.set_right(other.right)
			Current.set_left(other.left)
			Result:=Current
		end

	subtract(other: like Current): RANGE
		require
			other.overlaps (Current)
		do
			Current.set_left (other.left)
			Current.set_right (other.right)
			Result:=Current
		end

end
