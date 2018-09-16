note
	description: "Summary description for {NEWBAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEWBAG

create
    create_bag

feature
   elements:ARRAY[CELL_INFO]
   max_num: CHARACTER
   min_num: CHARACTER

feature

    create_bag
        do
             create elements.make_empty
        end

	add(val: CHARACTER; n: INTEGER)
		require
			pos_numb: n > 0
		local
		    cell_element:CELL_INFO
		    cond:BOOLEAN
		    i:INTEGER
		do
		    cond:=false
			from
				i:=1
			until
				i>elements.count or cond
			loop
				if elements[i].value = val then
				    cond:=true

					elements[i].incr(n)
				end
				i:=i+1
			end
			if not cond then
			    create cell_element.create_cell_info(val, n)

			    elements.force(cell_element, elements.count + 1)
			end

		end




	remove(val: CHARACTER; n: INTEGER)
		require
			pos_numb: n > 0
		local
			i:INTEGER
		do
			from
				i:=1
			until
				i>elements.count
			loop

				if elements[i].value = val then
					if elements[i].number_copies < n then
						elements[i].set_number (0)
					else
						elements[i].set_number (elements[i].number_copies - n)
				end
				end
				i:=i+1
			end

		end

    min:CHARACTER
    	local
    		int:INTEGER
        do
            int:=1
            min_num:=elements[int].value
            from
                int:=1
            until
                int>elements.count
            loop
                if elements[int].value < min then
                    min_num := elements[int].value
                end
                int:= int + 1
            end
            Result:=min_num
        end

    max:CHARACTER
    	local
    		i:INTEGER
        do
            i:=1
            max_num:=elements[i].value
            from
                i:=1
            until
                i>elements.count
            loop
                if elements[i].value > max_num then
                    max_num:=elements[i].value
                end
                i:=i+1
            end
            Result:=max_num
        end

    count: INTEGER
        do
            Result := elements.count
        end

    is_equal_bag(bag:NEWBAG):BOOLEAN
    	local
    		index1,index2,count1: INTEGER
        do

        	if elements.count = bag.count then
        		from
					index1:=0
				until
					index1 = elements.count
				loop
					index1:=index1 + 1
					from
						index2:=0
					until
						index2>elements.count
					loop
						index2:=index2 + 1

						if elements[index1].value = bag.elements[index2].value and elements[index1].number_copies = bag.elements[index2].number_copies then
							count1:= count1 + 1
						end
					end
				end

				if count1 = elements.count then
					Result:= true
				else
					Result:=false
				end
        	else
        		Result:=false
        	end

        end


end
