note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	set_subject, set_owner, set_place, set_date

feature
	owner: PERSON
	subject: STRING
	place: STRING
	date: TIME

feature
	set_date(d: TIME)
		do
			date:=d
		end

	set_owner(o: PERSON)
		do
			owner:=o
		end

	set_subject(s: STRING)
		do
			subject:=s
		end

	set_place(p: STRING)
		do
			place:=p
		end
end
