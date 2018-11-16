note
	description: "Summary description for {CHESS_TABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CHESS_TABLE

create
	make

feature

	table: ARRAY2[INTEGER]

	make
	do
		create table.make_filled (0, 8, 8)
	end

	print_table
	local
		i, j: INTEGER
	do
		from i := 1
		until i > 8
		loop
			from j := 1
			until j > 8
			loop
				if table.item (i, j) = 0 then
					io.put_character ('.')
				else
					io.put_string (table.item (i, j).out)
				end
				j := j + 1
			end
			io.put_new_line
			i := i + 1
		end
		io.put_new_line
	end

end
