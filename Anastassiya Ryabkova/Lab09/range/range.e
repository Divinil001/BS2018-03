note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE
create set_range


	feature --implementation
		left:INTEGER
		right:INTEGER


		set_range(new_left:INTEGER; new_right:INTEGER)
			do
				left:= new_left
				right:=new_right
			end



		is_equal_range(other: like Current):BOOLEAN
		require range_exist:other.is_empty = False

			do

					if
						Current.right = other.right and Current.left = other.left
					then
						Result:=true
					end
				end


		is_empty:BOOLEAN

			do
				if Current.right < Current.left  then
					Result:=true
				end
			end

		is_sub_range_of(other: like Current):BOOLEAN
		require range_exist:other.is_empty = False
			do
				if
					Current.right> other.right and Current.left< other.left
				then
					Result:=true
				end
			end

		is_super_range_of(other: like Current):BOOLEAN
		require range_exist:other.is_empty = False
		 	do
		 		if
		 			other.right > Current.right and other.left < Current.left
		 		then
		 			Result:=true
		 		end
		 	end

		 left_overlaps(other: like Current):BOOLEAN
		 require range_exist:other.is_empty = False
		 do
		 	if
		 		Current.left>= other.left and other.left<=Current.right or Current.left<= other.left and other.left<=Current.right
		 	then
		 		Result:=true
		 	end
		 end

		 right_overlaps(other: like Current): BOOLEAN
		 require range_exist:other.is_empty = False
		 	do
		 		if
		 			Current.right<= other.right and other.left>=Current.left or Current.right>= other.right and other.left>=Current.left
		 		then
		 			Result:=true
		 		end
		 	end

		overlaps(other: like Current): BOOLEAN
		require range_exist:other.is_empty = False
			do
				if
					Current.right_overlaps (other) = true and Current.left_overlaps (other) = true
				then
					Result:=true
				end
			end

		add(other: like Current): RANGE
		require range_exist:other.is_empty = False
			local a_left, a_right:INTEGER
			do
				a_left:=0 --default creation of result range
				a_right:=0

				create Result.set_range(a_left,a_right)
				if
					Current.right>= other.right
				then
					Result.set_range (Current.left,Current.right)


				elseif
					Current.right<= other.right

				then

					Result.set_range (Current.left,other.right)

				elseif Current.left>=other.left then
					Result.set_range (other.left, Current.right)
				elseif Current.left<=other.left then

					Result.set_range (Current.left, Current.right)
				end
			end


			subtract(other: like Current): RANGE
			require range_exist:other.is_empty = False
			local a_left, a_right:INTEGER
			do

				a_left:=0 --default creation of result range
				a_right:=0

				create Result.set_range(a_left,a_right)

				if
					Current.right<= other.right
				then
					Result.set_range (Current.left,Current.right)


				elseif
					Current.right>= other.right

				then

					Result.set_range (Current.left,other.right)

				elseif other.left >=Current.left then

					Result.set_range (other.left, Current.right)
				elseif other.left >=Current.left then

					Result.set_range (Current.left, Current.right)
				end
			end





end
