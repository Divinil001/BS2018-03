note
	description: "BAG application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	elements: ARRAYED_LIST[CELL_INFO]

feature {NONE} -- Initialization
	make
		local
			element: CELL_INFO
			i: INTEGER
			-- Run application.
		do
			--| Add your code here
			create elements.make(0)
			from
				i:=0
			until
				i>=128
			loop
				create element.make(i.to_character_8)
				elements.extend(element)
				i:=i+1
			end
		end

feature
	add(val: CHARACTER; n: INTEGER)
		do
			elements.at(val.code+1).add_number_copies(n)
		end

	remove(val: CHARACTER;n: INTEGER)
		do
			elements.at(val.code+1).add_number_copies(-n)
		end

	min: CHARACTER
		local
			i: INTEGER
	 		minimal: CHARACTER
		do
	 		minimal:=elements.at(128).value
	 		from
	 			i:=1
	 		until
	 			i>=128
	 		loop
	 			if
	 				elements.at(i).number_copies>0 and elements.at(i).value<minimal
	 			then
	 				minimal:=elements.at(i).value
	 			end
	 			i:=i+1
	 		end
	 	Result:=minimal
	 	end

	max: CHARACTER
		local
	 		i: INTEGER
	 		maximum: CHARACTER
	 	do
	 		maximum:=elements.at(1).value
	 		from
	 			i:=1
	 		until
	 			i>=128
	 		loop
	 			if
	 				elements.at(i).number_copies>0 and elements.at(i).value>maximum
	 			then
	 				maximum:=elements.at(i).value
	 			end
	 			i:=i+1
	 		end
	 	Result:=maximum
	 	end

	is_equal_bag(b:APPLICATION):BOOLEAN
		local
	 			i: INTEGER
	 	do
	 		from
	 			i:=1
	 		until
	 			i>=128
	 		loop
	 			if
	 				b.elements.at(i).number_copies=current.elements.at(i).number_copies
	 			then
	 				Result:=True
	 			else
	 				Result:=False
	 			end
	 			i:=i+1
	 		end
	 	end

end
