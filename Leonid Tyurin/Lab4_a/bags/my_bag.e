note
	description: "Summary description for {MY_BAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_BAG

create
	make_bag

feature

	make_bag
		local
			i:INTEGER
			temp:CELL_INFO
		do
			create elements.make_empty
			from
				i := 1
			until
				i = 256
			loop
				create temp.create_cell (i.to_character_8, 0)
				elements.force (temp, i)
				i := i + 1
			end

		end

	elements:ARRAY[CELL_INFO]

	add(val:CHARACTER; n:INTEGER)
		require
			more_zero : n > 0
		local
			a,b:CELL_INFO
		do
			across elements as element
				loop
					if element.item.value.is_equal (val) then
						a := element.item
						element.item.increase_num (n)
						b := element.item
					end
			 	end
		end

	remove (val: CHARACTER; n:INTEGER)
		require
			more_zero : n > 0
		local
			b:CELL_INFO
		do
			across elements as element
				loop
					if element.item.value.is_equal (val) then
						element.item.decrease_num (n)
						b := element.item
					end
			 	end
		end

	min:CHARACTER
		local
			flag:BOOLEAN
			i:INTEGER
		do
			flag := false
			from
				i := 1
			until
				i = 256
			loop
				if not flag and elements[i].number_copies /= 0 then
					flag := true
					io.put_character (elements[i].value)
				end
				i := i + 1
			end
		end


	max:CHARACTER
		local
			flag:BOOLEAN
			i:INTEGER
		do
			flag := false
			from
				i := 255
			until
				i = -1
			loop
				if not flag and elements[i].number_copies /= 0 then
					flag := true
					io.put_character (elements[i].value)
				end
				i := i - 1
			end
		end

	is_equal_bag(b:MY_BAG):BOOLEAN
		require
			not_empty : not b.elements.is_empty
		local
			i:INTEGER
		do
			result := true
			from
				i := 1
			until
				i = 256
			loop
				if elements[i].number_copies /= b.elements[i].number_copies then
					result := false
				end
				i := i + 1
			end
		end

end
