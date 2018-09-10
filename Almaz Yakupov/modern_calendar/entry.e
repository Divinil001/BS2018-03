note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	set

feature
	data: TIME
	owner: PERSON
	subject: STRING
	place: STRING

	set(i_d: TIME; i_o: PERSON; i_s: STRING; i_p: STRING)
		do
			data := i_d
			owner := i_o
			subject := i_s
			place := i_p
		end

end
