note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

feature
	data: TIME
	owner: PERSON
	subject: STRING
	place: STRING

feature
	set(d: TIME; o: PERSON; s: STRING; p: STRING)
		do
			data:=d
			owner:=o
			subject:=s
			place:=p
		end

end
