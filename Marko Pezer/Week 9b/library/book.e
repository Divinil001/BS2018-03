note
	description: "Summary description for {BOOK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOOK

create
	make

feature

	id: INTEGER
	name: STRING
	for_kids: BOOLEAN
	taken: BOOLEAN

feature

	make (i: INTEGER; n: STRING; fk: BOOLEAN)
	do
		id := i
		name := n
		for_kids := fk
		taken := False
	end

	set_taken (t: BOOLEAN)
	do
		taken := t
	end

end
