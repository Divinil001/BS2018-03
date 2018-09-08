class
	ENTRY

create
	init

feature
	date: DAY
	time: TIME
	owner: PERSON
	subject: STRING
	place: STRING

feature
	init(date_:DAY; time_: TIME; owner_: PERSON; sub: STRING; where: STRING)
		do
			date := date_
			time := time_
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

	set_date(new_date: DAY)
		do
			date := new_date
		end

	get_name : STRING
		do
			Result := owner.get_name
		end

	get_time : TIME
		do
			Result := time
		end
end
