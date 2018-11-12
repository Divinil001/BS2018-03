note
	description: "Summary description for {BIO_INFORMATIC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIO_INFORMATIC

inherit
	BIOLOGIST
		redefine
			introduce
		end


	COMPUTER_SCIENTIST
		rename
			introduce as intr,
			discipline as d,
			name as n,
			id as i,
			set_name as sn,
			set_discipline as sd
		end

create
	create_bioinfo

feature
	create_bioinfo(my_name, a_pet_name, my_discipline:STRING; my_id:INTEGER)
		local
			my_pet:PET
		do
			create my_pet.tame_pet (a_pet_name)
			pet_name:=my_pet.get_pets_name
			set_name (my_name)
			set_discipline (my_discipline)
			id:=my_id
			d:=""
			n:=""
			bio:="Empty"
		--	print(introduce)
		end


	introduce:STRING
		do
			Result:=precursor + "My bio: " + bio
		end

	set_bio(biog:STRING)
		do
			bio:=biog
		end

feature
	bio:STRING

end
