note
	description: "Summary description for {RENTAILS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RENTALS

create
	make

feature

	person: PERSON
	equipment: ARRAYED_LIST[STRING]
	available: BOOLEAN

feature

	make (p : PERSON)
	do
		person := p
		create equipment.make(0)
		available := False
	end

	add (x: STRING)
	do
		equipment.extend (x)
	end

	return
	do
		available := True
	end

end
