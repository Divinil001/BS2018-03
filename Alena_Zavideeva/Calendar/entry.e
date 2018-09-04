class
	ENTRY
create
	make

feature
	date: TIME
	owner: PERSON
	subject: STRING
	place: STRING

	make(date_a: TIME; owner_a: PERSON; subject_a: STRING;
	place_a: STRING)
		do
			date := date_a
			owner := owner_a
			subject := subject_a
			place := place_a
		end
feature
	set_subject(subject_a: STRING)
	do
		subject := subject_a
	end

	set_date(date_a: TIME)
	do
		date := date_a
	end

	get_name: STRING
	do
		Result := owner.get_name
	end

	get_place: STRING
	do
		Result := place
	end

	get_time: TIME
	do
		Result := date
	end
end
