note
	description: "Summary description for {EVENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EVENT

create
	make

feature

	time: INTEGER
	name: STRING

	make (n: STRING; h, m: INTEGER)
	require
		correct_time: h >=0 and m >= 0
	do
		time := h * 60 + m
		name := n
	ensure
		correct_time: time >= 0
	end

	print_event
	do
		io.put_string ("Time: " + (time // 60).out + ":" + (time \\ 60).out + "%N")
		io.put_string ("Name: " + name + "%N%N")
	end

	get_time: INTEGER
	do
		Result := time
	end

end
