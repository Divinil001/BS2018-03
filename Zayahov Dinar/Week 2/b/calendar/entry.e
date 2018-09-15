note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY
inherit
	DATE_VALUE; TIME_VALUE
create
	set_subject, set_owner, set_place, set_date_o

feature
	owner: PERSON
	subject: STRING
	place: STRING
	date_0: TIME

feature
	set_date_o(y,m,d,h,m0,s:INTEGER)
		do
			set_second(s)
			set_minute(m0)
			set_hour(h)
			set_date(y,m,d)
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
