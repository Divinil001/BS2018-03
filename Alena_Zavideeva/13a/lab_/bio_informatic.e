class
	BIO_INFORMATIC

inherit

	BIOLOGIST
		rename
			make as make_bio
		redefine
			introduce
		select
			introduce
		end

	COMPUTER_SCIENTIST
		rename
			make as make_cs,
			introduce as intro_cs
		end

create
	make

feature {NONE}

	short_biography: STRING

feature

	make (name_: STRING; id_: INTEGER; pet_, short_biography_: STRING)
		do
			make_bio (name_, id_, pet_)
			discipline := "Bio-informatician"
			short_biography := short_biography_.out
		end

	introduce
		do
			Precursor {BIOLOGIST}
			print ("Short biography: " + short_biography + "%N")
		end

	get_biography: STRING
		do
			create Result.make_from_string (short_biography)
		end

end
