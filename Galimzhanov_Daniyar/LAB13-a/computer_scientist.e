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
	create_comp

feature
	create_comp(my_name, my_discipline:STRING;my_id:INTEGER)
		do
			set_name (my_name)
			discipline := my_discipline
			id:=my_id
		end



end
