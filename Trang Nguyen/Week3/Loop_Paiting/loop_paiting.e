note
	description: "loop_painting application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	LOOP_PAINTING

inherit
	ARGUMENTS

create
	loop_painting

feature {NONE} -- Initialization

	loop_painting
			-- Run application.
		do
			--| Add your code here
			enter_num
			painting
		end

feature -- Access

	painting
			-- Loop painting
		local
			row, mul: INTEGER
			space: STRING
		do
			set_list
			io.put_string ("Loop painting:")
			io.new_line
			from row := 1
			until row > num
			loop
				space := " "
				if row < num then
					mul := list1.i_th (num).count + list2.i_th (num).count + 1 - list2.i_th (row).count - list1.i_th (row).count
					space.multiply (mul)
				end
				io.put_string (list1.i_th (row))
				io.put_string (space)
				io.put_string (list2.i_th (row))
				io.new_line
				row := row + 1
			end
		end

	list2: ARRAYED_LIST [STRING]
			-- Inversed string of numbers

	list1: ARRAYED_LIST [STRING]
			-- List string of numbers

	enter_num
			-- Enter number from keyboard
		local
			error: BOOLEAN
		do
			from error := TRUE
			until error = FALSE
			loop
				io.put_string ("Enter a number: ")
				io.new_line
				io.read_line
				if io.last_string.is_integer then
					num := io.last_string.to_integer.abs
					error := FALSE
				end
				io.new_line
			end
		end

	num: INTEGER
			-- Number of colum

feature -- Element change

	set_list
		local
			number, count, max, row: REAL
			num_string1, num_string2: STRING
		do
			number := 0
			create list1.make (num)
			create list2.make (num)
			from row := 1
			until row > num
			loop
				num_string1 := " "
				num_string2 := " "
				if row.floor \\ 2 = 0 then
					max := number + row / 2
					from count := 0
					until count = (row / 2)
					loop
						number := number + 1
						num_string1.append_string (" " + number.out)
						num_string2.append_string ((max - count).out + " ")
						count := count + 1
					end
				else
					max := number + (row + 1) / 2
					from count := 0
					until count = ((row + 1) / 2)
					loop
						number := number + 1
						num_string1.append_string (number.out + " ")
						num_string2.append_string (" " + (max - count).out)
						count := count + 1
					end
				end
				list1.extend (num_string1)
				list2.extend (num_string2)
				row := row + 1
			end
		end
end
