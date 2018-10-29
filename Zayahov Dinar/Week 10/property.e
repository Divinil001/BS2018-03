note
	description: "Summary description for {PROPERTY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PROPERTY

create
	make

feature
	position: INTEGER
	name: STRING
	price: INTEGER
	rent: INTEGER
	owner: PLAYER assign set_owner

feature
	make(pos: INTEGER; n: STRING; pr: INTEGER; r: INTEGER; o: PLAYER)
		do
			position:=pos
			name:=n
			price:=pr
			rent:=r
			owner:=o
		end

	set_owner(o: PLAYER)
		do
			owner:=o
		end

end
