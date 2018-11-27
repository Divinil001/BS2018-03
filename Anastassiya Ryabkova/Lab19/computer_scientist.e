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



	make (n: STRING; i: INTEGER)

		do

			set_discipline ("Computer scientist")

			set_name (n)

			set_id (i)

		end



end
