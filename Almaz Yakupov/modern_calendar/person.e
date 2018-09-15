note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	set

feature
	name: STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING

	set(i_n: STRING; i_p: INTEGER; i_w: STRING; i_e: STRING)
		do
			name := i_n
			phone_number := i_p
			work_place := i_w
			email := i_e
		end

end
