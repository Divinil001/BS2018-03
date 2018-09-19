note
	description: "Summary description for {BAG_CLASS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAG_CLASS
feature
	elements: ARRAYED_LIST[CELL_INFO]

	print_bag
		do
			print(elements)
		end

	add(val: CHARACTER; n: INTEGER)
		local
			x: INTEGER
			i: INTEGER
			is_finded: BOOLEAN
			c: CELL_INFO
		do
			is_finded := false
			from
				i := 1
			until
				i > elements.count
			loop
				if elements[i].value = val then
					elements[i].set_number( elements[i].get_number + n)
					is_finded := true
				end
			end
			if not is_finded then
				create c
				c.make(val, n)
				elements.force (c)
			end
		end

--	remove(val: CHARACTER; n: INTEGER)
--		do
--			
--		end
--	min: CHARACTER
--		do
--			
--		end
--	max: CHARACTER
--		do
--			
--		end
--	is_equal_bag(b: BAG_CLASS): BOOLEAN
--		do
--			
--		end
end
