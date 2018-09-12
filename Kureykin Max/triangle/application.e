note
	description: "triangle application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization
	count_strings:INTEGER
	height:INTEGER

	make
			-- Run application.
		do
			--| Add your code here
			count_strings:=0
			print("Eneter height...%N")
			Io.read_integer_32
			height:=Io.last_integer_32

			draw_triangle
		end

	draw_triangle
	local
		prev_str:STRING
		str:STRING
		number:INTEGER
		len:INTEGER
	do
		prev_str:=""
		str:=""
		number:=1

		from
			count_strings := 0
		until
			count_strings = height
		loop
			if str.count > prev_str.count then

				prev_str := str
				str := ""
				count_strings := count_strings + 1
			else
				str := str + number.out + " "
				number := number + 1
			end


		end

		len:=prev_str.count
		prev_str:=""
		str:=""
		number:=1

		from
			count_strings:=0
		until
			count_strings = height
		loop
			if str.count > prev_str.count then

				prev_str := str
				print(prev_str + spaces((len-prev_str.count + 1)*2) + reverse_str(prev_str) +"%N")
				str := ""
				count_strings := count_strings + 1
			else
				str := str + number.out + " "
				number := number + 1
			end
		end
	end

	reverse_str(str:STRING):STRING
	local
		i:INTEGER
		local_str:STRING
		num_list:LIST[STRING]
		init_list:LINKED_LIST[STRING]
	do
		create init_list.make
		num_list := init_list
		i:=1

		local_str:=""
		--print("STR: "+str+"%N")
		num_list := str.split (' ')
		--print("LEN: "+num_list.count.out+"%N")
		from
			i:=0
		until
			i = num_list.count
		loop
			local_str := local_str + num_list.at (num_list.count - i).out + " "
			i:=i+1
		end
		if str.count = 2 then
			local_str := " " + str
		end
		Result:= local_str
	end

	spaces(n:INTEGER):STRING
	do
		Result:=" "
		Result.multiply (n)
	end

end
