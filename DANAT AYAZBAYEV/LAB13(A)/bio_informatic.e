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
			introduce as abcd
		end
	COMPUTER_SCIENTIST
		rename
			introduce as abcd
		undefine
			abcd
		end


create
	initialization


feature
	short_biography : STRING


feature
	initialization (id_ : INTEGER; name_ : STRING; discipline_ : STRING; pet_ : STRING; bio : STRING)
		do
			initialize(id_, name_, discipline_, pet_)
			set_bio(bio)
		end
	set_bio (bio : STRING)
		do
			short_biography := bio
		end

feature
	introduce : STRING
		do
			Result := "My name is " + name + "%NMy id is " + id.out + "%NMy discipline is " + discipline + "%N"
			Result := Result + "My pet is " + pet + "%NMy bio is " + short_biography + "%N"
		end

end
