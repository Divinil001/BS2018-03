note
	description: "Summary description for {BIOLOGIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIOLOGIST

inherit
	SCIENTIST
		redefine
			introduce
		end

create
	initialize

feature
	initialize (id_ : INTEGER; name_ : STRING; discipline_ : STRING; pet_ : STRING)
		do
			init(id_, name_, discipline_)
			set_pet(pet_)
		end

feature
	pet : STRING
	set_pet (pet_ : STRING)
		do
			pet := pet_
		end
	introduce : STRING
		do
			Result := precursor
			Result := Result + "My pet is " + pet + "%N"
		end

end
