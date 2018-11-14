note
	description: "Summary description for {BIOLOGIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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

feature
	discipline: STRING
	once
		Result:="Biologist"
	end

	make(i: INTEGER; n: STRING; p:PET)
		do
			id:=i
			name:=n
			pet:=p
		end

	introduce: STRING
		do
			Result:=Precursor + " Pet's name: " + pet.name.out
		end
end
