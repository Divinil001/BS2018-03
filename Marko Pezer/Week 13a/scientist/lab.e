note
	description: "Summary description for {LAB}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LAB

create
	make

feature

	lab_list: ARRAY[SCIENTIST]
	size: INTEGER
	person: COMPUTER_SCIENTIST

	make
	do
		create person.make (0, "Nobody", "No")
		create lab_list.make_filled (person, 1, 100)
		size := 0
	end

	add_member (m: SCIENTIST)
	do
		size := size + 1
		lab_list.put (m, size)
	end

	remove_member
	do
		size := size - 1
	end

	print_lab
	local
		i: INTEGER
	do
		io.put_string ("LAB MEMBERS: %N")

		from i := 1
		until i > size
		loop
			io.put_string (lab_list.item (i).name + "%N")
			i := i + 1
		end

		io.put_new_line
	end

end
