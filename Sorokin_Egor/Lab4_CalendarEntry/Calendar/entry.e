class
	ENTRY

create
	init

feature
	date: TIME
	owner: PERSON
	subject: STRING
	place: STRING

feature
	init(date_: TIME; owner_: PERSON; sub: STRING; where: STRING)
		do
			date := date_
			owner := owner_
			subject := sub
			place := where
		end

	set_subject(new_sub: STRING)
		do
			subject := new_sub
		end

	set_place(new_place: STRING)
		do
			place := new_place
		end

	set_date(new_date: TIME)
		do
			date := new_date
		end

	get_name : STRING
		do
			Result := owner.get_name_()
		end

	get_date : TIME
		do
			Result := date
		end
end
