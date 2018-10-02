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
	left:INTEGER
	right:INTEGER

	set_left(l:INTEGER)
	require
		positive_left_border:l >= 0
	do
		left := l
	end

	set_right(r:INTEGER)
	require
		positive_right_border:r >= 0
	do
		right := r
	end

feature
	create_range(l,r:INTEGER)
	do
		left:=l
		right:=r
	end

feature
	is_equal_range(r:RANGE):BOOLEAN
	local
		res : BOOLEAN
	do
		if r.left = left and r.right = right then
			res := TRUE
		else
			res := FALSE
		end

		Result := res
	end

	is_empty:BOOLEAN
	do
		if left = right or left > right then
			Result := TRUE
		else
			Result := FALSE
		end
	end

	is_sub_range_of(r:RANGE):BOOLEAN
	do
		if left - r.left >= 0  and r.right - right >= 0 then
			Result := TRUE
		else
			Result := FALSE
		end
	end

	is_super_range_of(r:RANGE):BOOLEAN
	do
		if r.left - left >= 0  and right - r.right >= 0 then
			Result := TRUE
		else
			Result := FALSE
		end
	end

	left_overlaps(r:RANGE):BOOLEAN
	do
		if (left = r.right) or (r.right - left > 0 and right > r.right) or (left - r.left >= 0 and r.right - right >= 0) then
			Result:= TRUE
		else
			Result:= FALSE
		end
	end

	right_overlaps(r:RANGE):BOOLEAN
	do
		if (right = r.left) or (right - r.left > 0 and r.right > right) or (r.right - right >= 0 and left - r.left >=0) then
			Result:= TRUE
		else
			Result:= FALSE
		end
	end

	overlaps(r:RANGE):BOOLEAN
	do
		if right_overlaps (r) or left_overlaps (r) then
			Result := TRUE
		else
			Result:= FALSE
		end
	end

	add(r:RANGE):RANGE
	require
		have_overlap:overlaps(r) or right + 1 = r.left or r.right + 1 = left
	local
		resR:RANGE
	do
		create resR.create_range (0, 0)

		if left_overlaps (r) then
			resR.set_left(r.left)
		else
			resR.set_left(left)
		end

		if right_overlaps (r) then
			resR.set_right(r.right)
		else
			resR.set_right(right)
		end

		if right + 1 = r.left then
			resR.set_left (left)
			resR.set_right (r.right)
		end

		if r.right + 1 = left then
			resR.set_left (r.left)
			resR.set_right (right)
		end

		Result:=resR
	end

	subtract(r:RANGE):RANGE
	require
		connect_border:left = r.left or right = r.right
		curr_is_super_of_r: is_super_range_of (r)
	local
		resR:RANGE
	do
		create resR.create_range (0, 0)

		if left = r.left then
			resR.set_left (r.right)
			resR.set_right (right)
		end

		if(right = r.right) then
			resR.set_left (left)
			resR.set_right (r.left)
		end

		Result:=resR
	end

invariant
	--right >= left

end
