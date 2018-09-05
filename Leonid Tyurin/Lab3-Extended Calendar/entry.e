note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	init

feature

	init
		do
			create date.make (0, 0, 0)
			create owner.init
			subject := ""
			place := ""
		end

	set_entry(d:TIME; o:PERSON; s:STRING; p:STRING)
		do
			date := d
			owner := o
			subject := s
			place := p
		end

	date:TIME

	owner:PERSON

	subject:STRING

	place:STRING

	set_date(d:TIME)
		do
			date := d
		end

	set_owner(o:PERSON)
		do
			owner := o
		end

	set_subject(s:STRING)
		do
			subject := s
		end

	set_place(p:STRING)
		do
			place := p
		end

end
