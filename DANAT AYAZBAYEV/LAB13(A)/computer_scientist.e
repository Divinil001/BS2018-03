note
	description: "Summary description for {COMPUTER_SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMPUTER_SCIENTIST

inherit
	SCIENTIST
		redefine
			introduce
		end

create
	init

feature
	introduce : STRING
		do
			Result := precursor
		end

end
