note
	description: "Summary description for {FREE_PARKING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FREE_PARKING
inherit
	SQUARE

create
	make

feature
	make(new_name: STRING)
	do
		name := new_name
	end

	action(p: PLAYER)
	do
	end

	info:STRING
	do
		Result := "%NThis is " + name + ". No actions.%N"
	end

end
