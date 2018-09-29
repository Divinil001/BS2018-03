note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class RANGE
create make

feature

	left: INTEGER
	right: INTEGER

feature

	make (a, b: INTEGER)
	do
		set_left (a)
		set_right (b)
	end

	set_left (x: INTEGER)
	do
		left := x
	end

	set_right (x: INTEGER)
	do
		right := x
	end

	is_equal_range (other: like Current): BOOLEAN
	require
		-- There are no requirements
		always_true: True
	do
		Result := False
		if (Current.left = other.left and Current.right = other.right)  then
			Result := True
		end
	end

	is_empty: BOOLEAN
	do
		Result := True
		if right >= left then
			Result := False
		end
	end

	is_sub_range_of (other: like Current): BOOLEAN
	require
		-- There are no requirements
		always_true: True
	do
		Result := False
		if (Current.left >= other.left and Current.right <= other.right) then
			Result := True
		end
	end

	is_super_range_of (other: like Current): BOOLEAN
	require
		-- There are no requirements
		always_true: True
	do
		Result := False
		if (Current.left <= other.left and Current.right >= other.right) then
			Result := True
		end
	end

	left_overlaps (other: like Current): BOOLEAN
	require
		-- There are no requirements
		always_true: True
	do
		Result := False
		if (other.left >= Current.left and other.left <= Current.right) then
			Result := True
		end
		if (Current.is_empty or other.is_empty) then
			Result := False
		end
	end

	right_overlaps (other: like Current): BOOLEAN
	require
		-- There are no requirements
		always_true: True
	do
		Result := False
		if (other.right >= Current.left and other.right <= Current.right) then
			Result := True
		end
		if (Current.is_empty or other.is_empty) then
			Result := False
		end
	end

	overlaps (other: like Current): BOOLEAN
	require
		-- There are no requirements
		always_true: True
	do
		Result := False
		if ((other.right >= Current.left and other.right <= Current.right) or (other.left >= Current.left and other.left <= Current.right) or (Current.right >= other.left and Current.right <= other.right) or (Current.left >= other.left and Current.left <= other.right)) then
			Result := True
		end
		if (Current.is_empty or other.is_empty) then
			Result := False
		end
	end

	add (other: like Current): RANGE
	require
		Overlaps: Current.overlaps(other)
	local
		r: RANGE
	do
		create r.make (Current.left, Current.right)
		if other.left < r.left then r.set_left (other.left) end
		if other.right > r.right then r.set_right (other.right) end
		Result := r
	end

	subtract (other: like Current): RANGE
	require
		Not_super_range: Current.is_super_range_of (other) = False
	local
		r: RANGE
	do
		create r.make (Current.left, Current.right)
		if Current.overlaps (other) = False then
			Result := r
		elseif (Current.is_sub_range_of (other)) then
			r.set_left (0)
			r.set_right (-1)
			Result := r
		else
			if other.left <= Current.right then r.set_right (other.left) end
			if other.right >= Current.left then r.set_left (other.right) end
			Result := r
		end
	end

	print_range
	local
		i: INTEGER
		s: STRING
	do
		if Current.is_empty then
			io.put_string ("{/}")
		else
			s := "{"
			from i := Current.left
			until i > Current.right
			loop
				s.append (i.out + ", ")
				i := i + 1
			end
			s.remove_tail (2)
			s.append ("}")
			io.put_string (s)
		end
	end

end
