note
	description: "Summary description for {BIO_INFORMATIC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIO_INFORMATIC

inherit

	COMPUTER_SCIENTIST
	rename
		make as make1,
		introduce as introduce1
	end

	BIOLOGIST
	rename
		make as make2,
		introduce as introduce2
	end

create
	make

feature

	short_bio: STRING

	make (i: INTEGER; n: STRING; d: STRING; p: STRING; s: STRING)
	do
		set_id (i)
		set_name (n)
		set_discipline (d)
		set_pet (p)
		short_bio := s
	end

	introduce
	do
		io.put_string ("SCIENTIST INFO: ")
		io.put_string ("ID: " + id.out + "%N")
		io.put_string ("Name: " + name + "%N")
		io.put_string ("Discipline: " + discipline + "%N")
		io.put_string ("Short biography: " + short_bio + "%N")
		io.put_string ("Pet: " + pet + "%N%N")
	end

end
