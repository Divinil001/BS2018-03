note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature
	name: STRING

	make(a_name: STRING)
	do
		create name.make_empty
		name.copy (a_name)
	end

end
