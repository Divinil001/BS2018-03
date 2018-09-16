class
	ENTRY
create
	make
feature
	make(a_date: TIME; an_owner: PERSON; a_subject: STRING; a_place: STRING)
		do
			date := a_date
			owner := an_owner
			subject := a_subject
			place := a_place
		end
feature
	date: TIME
	owner: PERSON
	subject: STRING
	place: STRING

	set_subject(a_subject: STRING)
		do
			subject := a_subject
		end
	set_date(a_date: TIME)
		do
			date := date
		end
end
