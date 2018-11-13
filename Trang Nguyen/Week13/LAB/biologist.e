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
	make

feature

	make (n: STRING; i: INTEGER; p: STRING)
		do
			create pet.make (p)
			set_name (n)
			set_id (i)
			set_discipline ("Biologist")
		end

	pet: PET

	introduce
		do
			precursor
			print("Pet: " + pet.name + "%N")
		end

end
