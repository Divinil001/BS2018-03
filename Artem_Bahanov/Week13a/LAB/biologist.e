class
	BIOLOGIST
inherit
	SCIENTIST
	rename
		make as make0
	export
		{NONE}
		make0
	redefine
		introduce
	end
create
	make

feature
	pet: PET
	discipline: STRING
	once
		Result := "Biologist"
	end

	make(id_n: INTEGER name_n: STRING pet_n: PET)
	do
		name := name_n
		id := id_n
		pet := pet_n
	end

	introduce: STRING
	do
		Result := Precursor + "Pet's name: " + pet.name.out + "%N"
	end
end
