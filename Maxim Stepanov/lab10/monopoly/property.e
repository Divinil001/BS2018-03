note
	description: "Summary description for {PROPERTY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PROPERTY

create make

feature
	description: STRING
	price: INTEGER

	make(desc: STRING a_price: INTEGER)
	do
		description := desc
		price := a_price
	end

end
