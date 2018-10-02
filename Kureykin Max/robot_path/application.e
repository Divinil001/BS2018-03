note
	description: "robot_path application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	field:ARRAY2[INTEGER]
	path_way:STRING

	make
			-- Run application.
		do
			--| Add your code here
			create field.make_filled (0, 25, 25)
			path_way := ""
			print("Adjacency matrix, photo of graph can be found at the same folder...%N")
			read_file
			jump(1,"")
			print("Way from point 0 (on photo) to 24 (on photo), photo at the same folder!%N")
			print(path_way+"%N")
		end

	jump(curr:INTEGER; res:STRING)
	require
		valid_curr : curr > 0 and curr < 26
	local
		loc_res:STRING
	do
		loc_res := res
		if curr + 5 <= 25 then
			if field[curr, curr + 5] = 1 then
				loc_res := loc_res + "d"
				jump(curr + 5, loc_res)
				--CHECK here to be sure that recursion will not delete last command "d"
				if curr /= 20 then
					loc_res.remove_tail (1)
				end
			end
		end
		if curr + 1 <= 25 then
			if field[curr, curr + 1] = 1 then
				loc_res := loc_res + "r"
				jump(curr + 1, loc_res)
				--CHECK here to be sure that recursion will not delete last command "r"
				if curr /= 24 then
					loc_res.remove_tail (1)
				end


			end
		end
		if curr = 25 then
			path_way := res
		end
	end

	read_file
    local
    	my_file: PLAIN_TEXT_FILE
    	line:STRING
    	elements : LIST[STRING]
    	crt_list:LINKED_LIST[STRING]
    	i, j:INTEGER
    do
    	create my_file.make ("field.txt")
    	create crt_list.make
    	elements := crt_list
    	my_file.open_read

    	i:= 1
    	j:= 1

    	from
    	until my_file.end_of_file
    	loop
        	my_file.read_line
        	line := my_file.last_string
        	elements := line.split (',')
			from
				j := 1
			until
				j = 26
			loop
				field[i, j] := elements.at (j).to_integer_32
				print(field[i, j].out + "  ")
				j:= j + 1
			end
			print("%N")
			i := i + 1
    	end
    	my_file.close
    end

end
