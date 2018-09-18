note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

feature
	name: STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING

feature
	set(n:STRING; p_n: INTEGER; w_p: STRING; e: STRING)
		do
			name:=n
			phone_number:=p_n
			work_place:=w_p
			email:=e
		end

end
