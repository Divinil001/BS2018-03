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

feature {NONE}
	pet: PET

	set_pet(a_pet: PET)
	do
		pet := a_pet
	ensure
		pet = a_pet
	end

feature {ANY}
	get_pet: PET
	do
		Result := pet
	ensure
		Result = pet
	end

	introduce
	do
		print("Scientist's id: ")
		print(id)
		print("%N")
		print("Scientist's name: ")
		print(name)
		print("%N")
		print("Scientist's discipline: ")
		print(discipline)
		print("%N")
		print("Scientist's pet: ")
		print("%N Type: ")
		print(pet.get_type)
		print("%N Name: ")
		print(pet.get_name)
		print("%N")
	end

feature
	make(a_name, a_id, a_discipline, a_bio: STRING; a_pet: PET)
	do
		set_name(a_name)
		set_id(a_id)
		set_discipline(a_discipline)
		set_bio(a_bio)
		set_pet(a_pet)
	end
end
