note
	description: "Summary description for {PET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PET
create
	make

feature
	name: STRING

feature
	make(n: STRING)
		do
			name:=n
		end
end
