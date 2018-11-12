note
	description: "Summary description for {COMPUTER_SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMPUTER_SCIENTIST

inherit
	SCIENTIST

create
	make

feature

	make (i: INTEGER; n: STRING; d: STRING)
	do
		set_id (i)
		set_name (n)
		set_discipline (d)
	end

	introduce
	do
		io.put_string ("SCIENTIST INFO: ")
		io.put_string ("ID: " + id.out + "%N")
		io.put_string ("Name: " + name + "%N")
		io.put_string ("Discipline: " + discipline + "%N")
		io.put_string ("Short biography: No %N")
		io.put_string ("Pet: No %N%N")
	end

end
