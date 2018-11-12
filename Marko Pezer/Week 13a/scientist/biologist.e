note
	description: "Summary description for {BIOLOGIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIOLOGIST

inherit
	SCIENTIST

create
	make

feature

	pet: STRING

	make (i: INTEGER; n: STRING; d: STRING; p: STRING)
	do
		set_id (i)
		set_name (n)
		set_discipline (d)
		set_pet (p)
	end

	set_pet (p: STRING)
	do
		pet := p
	end

	introduce
	do
		io.put_string ("SCIENTIST INFO: ")
		io.put_string ("ID: " + id.out + "%N")
		io.put_string ("Name: " + name + "%N")
		io.put_string ("Discipline: " + discipline + "%N")
		io.put_string ("Short biography: No %N")
		io.put_string ("Pet: " + pet + "%N%N")
	end

end
