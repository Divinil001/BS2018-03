class
	BIOLOGIST
inherit SCIENTIST
redefine introduce end
create make

feature{NONE}
	pet : STRING
feature
	make(name_: STRING; id_: INTEGER; pet_: STRING)
		do
			name := name_.out
			id := id_
			pet := pet_.out
			discipline := "Biologist"
		end

	introduce
		do
			Precursor
			print("Pet: " + pet + "%N")
		end

	get_pet: STRING
		do
			create Result.make_from_string(pet)
		end

end
