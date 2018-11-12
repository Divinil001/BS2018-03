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
	create_biolog

feature
	create_biolog(my_name:STRING;my_id:INTEGER;my_discipline:STRING;name_of_pet:STRING)
		local
			my_pet: PET
		do
			set_name(my_name)
			id := my_id
			discipline := my_discipline
			create my_pet.tame_pet(name_of_pet)
			pet_name := my_pet.get_pets_name
		--	print(introduce)
		end


feature
	introduce:STRING
		do
			Result:=precursor + "My pet`s name: " + pet_name + "%N"
		end

feature
	pet_name:STRING

end
