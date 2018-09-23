note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE

feature
	left: INTEGER
	right: INTEGER

feature
	make_range(l,r: INTEGER)
		do
			left:=l
			right:=r
		end

	is_equal_range(other: like Current):BOOLEAN
	 do
	 	if
	 		Current.left=other.left and Current.right=other.right
	 	then
	 		Result:=True
	 	else
	 		Result:=False
	 	end
	 end

	is_empty: BOOLEAN
	 do
	 	if
	 		Current.left>Current.right
	 	then
	 		Result:=True
	 	else
	 		Result:=False
	 	end
	 end

	 is_sub_range_of(other: like Current): BOOLEAN
	 	 do
	 	 	if
	 	 		Current.left>=other.left and Current.right<=other.right
	 	 	then
	 	 		Result:=True
	 	 	elseif
	 	 		Current.is_empty=True
	 	 	then
	 	 		Result:=True
	 	 	else
	 	 		Result:=False
	 	 	end
	 	 end

	is_super_range_of(other: like Current): BOOLEAN
	 	do
	 	 	if
	 	 		Current.left<=other.left and Current.right>=other.right
	 	 	then
	 	 		Result:=True
	 	 	elseif
	 	 		other.is_empty=True
	 	 	then
	 	 		Result:=True
	 	 	else
	 	 		Result:=False
	 	 	end
	 	 end

	left_overlaps(other: like Current): BOOLEAN
		do
			if
				Current.left<=other.right and Current.left>other.left
			then
				Result:=True
			elseif
				other.is_empty=True
			then
				Result:=False
			else
				Result:=False
			end
		end

	right_overlaps(other: like Current): BOOLEAN
		do
			if
				Current.right>=other.left and Current.right<other.right
			then
				Result:=True
			elseif
				other.is_empty=True
			then
				Result:=False
			else
				Result:=False
			end
		end

	overlaps(other: like Current):BOOLEAN
		do
			if
				Current.left_overlaps (other)=True or Current.right_overlaps (other)=True or other.left_overlaps (Current)=True or other.right_overlaps (Current)=True
			then
				Result:=True
			elseif
				other.is_empty=True
			then
				Result:=False
			else
				Result:=False
			end
		end

	add(other: like Current): RANGE
		local
			result_range: RANGE
			L, R: INTEGER
		do
			create result_range
			if
				other.is_empty=True
			then
				result_range.make_range (Current.left, Current.right)
			end
			if
				left_overlaps(other)=True
			then
				L:=other.left
				R:=Current.right
				result_range.make_range (L,R)
			Result:=Current
			end
			if
				right_overlaps(other)=True
			then
				R:=other.right
				L:=Current.left
				result_range.make_range (L,R)
			end
		Result:=result_range
		end

	subtract(other: like Current): RANGE
		local
			result_range: RANGE
			L, R: INTEGER
		do
			create result_range
			if
				other.is_empty=True
			then
				result_range.make_range (Current.left, Current.right)
			end
			if
				left_overlaps(other)=True
			then
				L:=other.right
				R:=Current.right
				result_range.make_range (L+1,R)
			Result:=Current
			end
			if
				right_overlaps(other)=True
			then
				R:=other.left
				L:=Current.left
				result_range.make_range (L,R-1)
			end
		Result:=result_range
		end
end
