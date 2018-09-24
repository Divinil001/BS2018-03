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

	make(m,n: INTEGER)
		do
			set_left(m)
			set_right(n)
		end

	is_equal_range (other: like Current): BOOLEAN
		do
			Result:= left = other.left and right = other.right
		end


	is_empty: BOOLEAN
		do
			Result := left > right
		end


	is_sub_range_of (other: like Current): BOOLEAN
		do
			Result:= (left >= other.left and right <= other.right) or is_empty
		end


	is_super_range_of (other: like Current): BOOLEAN
		do
			Result:= (left <= other.left and right >= other.right) or other.is_empty
		end


	left_overlaps (other: like Current): BOOLEAN
		do
			Result:= left >= other.left and not other.is_empty and not is_empty
		end


	right_overlaps (other: like Current): BOOLEAN
		do
			Result:= right <= other.right and not other.is_empty and not is_empty
		end


	overlaps (other: like Current): BOOLEAN
		do
			Result := (left_overlaps(other) or right_overlaps(other)) or (other.left_overlaps(current) or other.right_overlaps(current))
		end


	add (other: like Current): RANGE
		require
			ERROR : overlaps(other) = true
		local
			qwerty : RANGE
		do
			create qwerty.make (left,right)
			if left>other.left then qwerty.set_left(other.left) end
			if right<other.right then qwerty.set_right(other.right) end
			other.make (other.left, other.right)
			Result:= qwerty
		end


	subtract (other: like Current): RANGE
		local
			l,r: BOOLEAN
			qwerty : RANGE
		do
			create qwerty.make (1,0)
			l:=other.left <= left and left <= other.right
			r:=other.right >= right and right >= other.left
			if l or r then
				if not (l and r) then
					if l then
						qwerty.set_left ( other.right+1)
					else
						qwerty.set_right ( other.left-1)
					end
				end
			end
			Result:=qwerty
		end


	set_left(m: INTEGER)
		do
			left := m
		end

	set_right(n: INTEGER)
		do
			right := n
		end

feature
	left, right: INTEGER
end
