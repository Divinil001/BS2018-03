note
	description: "Summary description for {BIO_INFORMATIC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIO_INFORMATIC

inherit
	BIOLOGIST
		rename
			make as make_bio
		redefine
			introduce
		end

	COMPUTER_SCIENTIST
		rename
			make as make_cs
		undefine
			introduce
		end

create
	make

feature

	make (n: STRING; i: INTEGER; p: STRING; bio: STRING)
		do
			set_name (n)
			set_id (i)
			create pet.make (p)
			set_bio (bio)
			set_discipline ("Bio-informatician")
		end

feature

	short_biography: STRING

	set_bio (b: STRING)
		do
			short_biography := b
		end

	introduce
		do
			print("Name: " + name + "%NID: " + id.out + "%N" + discipline + "%N")
			print("Pet: " + pet.name + "%N")
			print ("Biography: " + short_biography + "%N")
		end

end
