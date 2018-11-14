note
	description: "Summary description for {COMPUTER_SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMPUTER_SCIENTIST
inherit
	SCIENTIST
create
	make

feature
	discipline: STRING
	once
		Result:="Computer scientist"
	end

end
