note
	description: "Summary description for {S_ITEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	S_ITEM

create
	make

feature

	name: STRING
	number: INTEGER

	make (n: STRING; num: INTEGER)
	do
		name := n
		number := num
	end

	add_number (x: INTEGER)
	do
		number := number + x
	end

end
