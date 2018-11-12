note
	description: "Summary description for {PET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PET

create
	tame_pet

feature
	name:STRING

feature
	tame_pet(a_name:STRING)
		do
			name:=a_name
		end

	get_pets_name:STRING
		do
			Result:=name
		end

end
